//
//  PhotoDisplayController.m
//  Photodisplay
//
//  Created by apple2015 on 16/8/8.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "PhotoDisplayController.h"
#import "PhotoImageView.h"
@interface PhotoDisplayController ()<UIScrollViewDelegate,PhotoImageViewDelegate>
@property(nonatomic,strong)NSMutableArray * subViewList;
@end

@implementation PhotoDisplayController


- (void)viewDidLoad
{
    _subViewList=[NSMutableArray arrayWithCapacity:0];
    [self initScrollView];
    [self setPicCurrentIndex:self.currentIndex];

}


-(void)initScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.contentSize = CGSizeMake(self.imgArr.count*screen_width, screen_height);
    self.scrollView.delegate = self;
    self.scrollView.contentOffset = CGPointMake(0, 0);
  
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < self.imgArr.count; i++) {
        [_subViewList addObject:[NSNull class]];
    }

    self.sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, self.view.frame.size.height - 48 + 19, 60, 19)];
    self.sliderLabel.backgroundColor = [UIColor clearColor];
    self.sliderLabel.textColor = [UIColor whiteColor];
    self.sliderLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.currentIndex+1,(unsigned long)self.imgArr.count];
    [self.view addSubview:self.sliderLabel];

}

-(void)setPicCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    self.scrollView.contentOffset = CGPointMake(screen_width*currentIndex, 0);
    [self loadPhoto:_currentIndex];
    [self loadPhoto:_currentIndex+1];
    [self loadPhoto:_currentIndex-1];
}

- (void)loadPhoto:(NSInteger)page
{

    if (page<0||page>=self.imgArr.count) {
        
        return;
    }
    PhotoImageView * imageView=(PhotoImageView *)self.subViewList[page];
    
    if ([imageView isKindOfClass:[PhotoImageView class]]) {
        
    }else{
        CGRect frame = CGRectMake(page*_scrollView.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);

        PhotoImageView * photoView=[[PhotoImageView alloc]initWithFrame:frame withphotoPath:self.imgArr[page]];
        photoView.delegate=self;
        [_scrollView insertSubview:photoView atIndex:0];
        
        [self.subViewList replaceObjectAtIndex:page withObject:photoView];
    
    }
    


}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int i = scrollView.contentOffset.x/screen_width+1;
    [self loadPhoto:i-1];
    [self loadPhoto:i-2];
    [self loadPhoto:i];
    self.currentIndex = i-1;
    self.sliderLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.currentIndex+1,(unsigned long)self.imgArr.count];

}

- (void)handleSingerTapHideView
{
 
    [self dismissViewControllerAnimated:YES completion:nil];
  
}

@end
