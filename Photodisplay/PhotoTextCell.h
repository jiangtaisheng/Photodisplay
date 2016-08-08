//
//  PhotoTextCell.h
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoModel;
@interface PhotoTextCell : UITableViewCell

/**帖子内容*/
@property(nonatomic,strong)UILabel * articLB;
/**月*/
@property(nonatomic,strong)UILabel * monthLB;
/**日*/
@property(nonatomic,strong)UILabel * dayLB;

@property(nonatomic,strong)PhotoModel * model;
+(CGFloat)heightForBubbleWithObject:(PhotoModel *)model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
