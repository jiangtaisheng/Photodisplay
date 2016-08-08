//
//  PhotoDisplayController.h
//  Photodisplay
//
//  Created by apple2015 on 16/8/8.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>
// 屏幕宽与高
#define kMainScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kMainScreenHeight (([UIScreen mainScreen].bounds.size.height))
#define screen_width kMainScreenWidth
#define screen_height kMainScreenHeight
@interface PhotoDisplayController : UIViewController
/**
 *  接收图片数组，数组类型可以是url数组，image数组
 */
@property(nonatomic, strong) NSMutableArray *imgArr;
/**
 *  显示scrollView
 */
@property(nonatomic, strong) UIScrollView *scrollView;
/**
 *  显示下标
 */
@property(nonatomic, strong) UILabel *sliderLabel;
/**
 *  接收当前图片的序号,默认的是0
 */
@property(nonatomic, assign) NSInteger currentIndex;


@end
