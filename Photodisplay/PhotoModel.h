//
//  PhotoModel.h
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject
/**图片链接数组*/
@property(nonatomic,strong)NSArray * imgUrlArr;

/**文章*/
@property(nonatomic,copy)NSString * articStr;

/**月*/
@property(nonatomic,copy)NSString * monthStr;

/**天*/
@property(nonatomic,copy)NSString * dayStr;

/**判断是否隐藏*/
@property(nonatomic,assign)BOOL isShowLB;

/**视频*/
@property(nonatomic,copy)NSString * videoStr;

/**帖子id*/
@property(nonatomic,copy)NSString *  tid;
@end
