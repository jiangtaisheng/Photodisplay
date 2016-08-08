//
//  TakePicCell.h
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoModel;
@interface TakePicCell : UITableViewCell
/**日*/
@property(nonatomic,strong)UILabel * dayLB;

@property(nonatomic,strong)PhotoModel * model;

@property(nonatomic,strong)UIButton   * takePicBtn ;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
