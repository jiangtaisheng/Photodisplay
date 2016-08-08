//
//  PhotoImageView.m
//  Photodisplay
//
//  Created by apple2015 on 16/8/8.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "PhotoImageView.h"
#import "UIImageView+WebCache.h"
@interface PhotoImageView ()<UIScrollViewDelegate>


@end

@implementation PhotoImageView

- (instancetype)initWithFrame:(CGRect)frame withphotoPath:(NSString *)url
{

    if (self =[super initWithFrame:frame]) {
        
        _scrollView =[[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.backgroundColor=[UIColor blackColor];
        _scrollView.maximumZoomScale=3.0;
        _scrollView.minimumZoomScale=1.0;
        _scrollView.delegate=self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"1.jpg"]];

        [self.imageView setUserInteractionEnabled:YES];
        [_scrollView addSubview:_imageView];
        
        UITapGestureRecognizer * singer =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singerTap:)];
         UITapGestureRecognizer * doubler =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doublerTap:)];
    
        singer.numberOfTapsRequired=1;
        singer.numberOfTouchesRequired=1;
        doubler.numberOfTapsRequired=2;
    
        [_imageView  addGestureRecognizer:singer];
        [_imageView addGestureRecognizer:doubler];
        [singer requireGestureRecognizerToFail:doubler];//如果双击了，则不响应单击事件

    }

    return self;
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{

    return _imageView;
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{


    [scrollView setZoomScale:scale animated:YES];
}

- (void)singerTap:(UITapGestureRecognizer *)tap
{

    if (_delegate &&[_delegate respondsToSelector:@selector(handleSingerTapHideView)]) {
        
        [_delegate handleSingerTapHideView];
    }
}

- (void)doublerTap:(UITapGestureRecognizer *)tap
{
  
    if (tap.numberOfTapsRequired==2) {
        
        if (_scrollView.zoomScale==1) {
            
            float newScale=_scrollView.zoomScale*2;
            CGRect zoomRect=[self zoomRectForScale:newScale withCenter:[tap locationInView:tap.view]];
            [_scrollView zoomToRect:zoomRect animated:YES];
        }else{
        
            float newScale=_scrollView.zoomScale/2;
            CGRect zoomRect=[self zoomRectForScale:newScale withCenter:[tap locationInView:tap.view]];
            [_scrollView zoomToRect:zoomRect animated:YES];
        
        }
        
        
    }

}

#pragma mark - 缩放大小获取方法
-(CGRect)zoomRectForScale:(CGFloat)scale withCenter:(CGPoint)center{
    CGRect zoomRect;
    //大小
    zoomRect.size.height = [_scrollView frame].size.height/scale;
    zoomRect.size.width = [_scrollView frame].size.width/scale;
    //原点
    zoomRect.origin.x = center.x - zoomRect.size.width/2;
    zoomRect.origin.y = center.y - zoomRect.size.height/2;
    return zoomRect;
}


@end
