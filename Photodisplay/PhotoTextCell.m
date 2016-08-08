//
//  PhotoTextCell.m
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "PhotoTextCell.h"
#import "PhotoModel.h"
#define SelfView_H ([UIScreen mainScreen].bounds.size.height)
#define SelfView_W ([UIScreen mainScreen].bounds.size.width)
@implementation PhotoTextCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell1";
    PhotoTextCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PhotoTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    return self;
    
}


- (void)createUI
{
    self.dayLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 30)];
    self.dayLB.font=[UIFont boldSystemFontOfSize:25];
//    [self.dayLB setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];

    [self addSubview:self.dayLB];
    
    self.monthLB=[[UILabel alloc]initWithFrame:CGRectMake(50, 15, 30, 20)];
    self.monthLB.font=[UIFont boldSystemFontOfSize:12];
    [self addSubview:self.monthLB];
    
    self.articLB=[[UILabel alloc]initWithFrame:CGRectMake(100, 10,SelfView_W-100, 40)];
    self.articLB.numberOfLines=3;
    self.articLB.font=[UIFont boldSystemFontOfSize:12];

    [self addSubview:self.articLB];
    
    
    
    
}

- (void)setModel:(PhotoModel *)model
{
    
    _model=model;
    if (model.isShowLB)
    {
        self.dayLB.hidden=YES;
        self.monthLB.hidden=YES;
    }
    else
    {
        self.dayLB.hidden=NO;
        self.monthLB.hidden=NO;
        self.dayLB.text=model.dayStr;
        self.monthLB.text=model.monthStr;
    }
    
    CGSize size=[model.articStr boundingRectWithSize:CGSizeMake(SelfView_W-100, 80) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:12]} context:nil].size;
    self.articLB.frame=CGRectMake(100, 10,SelfView_W-100, size.height);
    self.articLB.text=model.articStr;
    
}


+(CGFloat)heightForBubbleWithObject:(PhotoModel *)model
{

    CGSize size=[model.articStr boundingRectWithSize:CGSizeMake(SelfView_W-100, 80) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:12]} context:nil].size;

    
    return size.height+20;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
