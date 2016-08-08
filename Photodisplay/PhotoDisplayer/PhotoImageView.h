//
//  PhotoImageView.h
//  Photodisplay
//
//  Created by apple2015 on 16/8/8.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoImageViewDelegate <NSObject>

- (void)handleSingerTapHideView;

@end

@interface PhotoImageView : UIView
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UIImageView * imageView;

@property(nonatomic,assign)id<PhotoImageViewDelegate>  delegate;
- (instancetype)initWithFrame:(CGRect)frame withphotoPath:(NSString *)url;




@end
