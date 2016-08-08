//
//  PhotoCell.h
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoModel;
@interface PhotoCell : UITableViewCell
/**左上拼图或全部或左边*/
@property(nonatomic,strong)UIImageView * img1;
/**右上拼图或右边*/
@property(nonatomic,strong)UIImageView * img2;
/**3张右下拼图或4张左下边*/
@property(nonatomic,strong)UIImageView * img3;
/**右下*/
@property(nonatomic,strong)UIImageView * img4;
/**整个*/
@property(nonatomic,strong) UIView * allImg;
/**帖子内容*/
@property(nonatomic,strong)UILabel * articLB;
/**月*/
@property(nonatomic,strong)UILabel * monthLB;
/**日*/
@property(nonatomic,strong)UILabel * dayLB;
/**照片数目*/
@property(nonatomic,strong)UILabel * imgCountLB;
/**Model*/
@property(nonatomic,strong)PhotoModel * model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
