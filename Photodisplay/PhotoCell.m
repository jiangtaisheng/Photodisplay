//
//  PhotoCell.m
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "PhotoCell.h"
#define SelfView_H ([UIScreen mainScreen].bounds.size.height)
#define SelfView_W ([UIScreen mainScreen].bounds.size.width)
#import "UIImageView+WebCache.h"
#import "PhotoModel.h"
@implementation PhotoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell3";
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    self.allImg=[[UIView alloc]initWithFrame:CGRectMake(100, 5, 80, 80)];
//    self.allImg.backgroundColor=[UIColor redColor];
    [self addSubview:self.allImg];
    
    self.img1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    [self.allImg addSubview:self.img1];
    self.img2=[[UIImageView alloc]initWithFrame:CGRectMake(42, 0, 38, 38)];
    
    [self.allImg addSubview:self.img2];
    self.img3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 42, 38, 38)];
    
    [self.allImg addSubview:self.img3];
    self.img4=[[UIImageView alloc]initWithFrame:CGRectMake(42, 42, 38, 38)];
    
    [self.allImg addSubview:self.img4];
    
    
    self.dayLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 40)];
    self.dayLB.font=[UIFont boldSystemFontOfSize:25];

    [self addSubview:self.dayLB];
   
    self.monthLB=[[UILabel alloc]initWithFrame:CGRectMake(50, 15, 30, 20)];
    self.monthLB.font=[UIFont boldSystemFontOfSize:12];
    [self addSubview:self.monthLB];
    
    self.articLB=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.allImg.frame), 10,SelfView_W-200, 40)];
    self.articLB.font=[UIFont boldSystemFontOfSize:12];
    self.articLB.numberOfLines=3;

    
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
    
    CGSize size=[model.articStr boundingRectWithSize:CGSizeMake(SelfView_W-200, 60) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:12]} context:nil].size;
    self.articLB.frame=CGRectMake(CGRectGetMaxX(self.allImg.frame), 10,SelfView_W-200, size.height);
    self.articLB.text=model.articStr;
    
    
    NSInteger count=model.imgUrlArr.count>4?4:model.imgUrlArr.count;
    switch (count) {
        case 1:
        {
            self.img4.hidden=YES;
            self.img3.hidden=YES;
            self.img2.hidden=YES;
            self.img1.hidden=NO;
            
            self.img1.frame=CGRectMake(0, 0, 80, 80);
            
    
            [self.img1 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[0]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
          
            
        }
            break;
            
        case 2:
        {
            
            
            self.img4.hidden=YES;
            self.img3.hidden=YES;
            self.img2.hidden=NO;
            self.img1.hidden=NO;
            
            self.img1.frame=CGRectMake(0, 0, 38, 80);
            self.img2.frame=CGRectMake(42, 0, 38, 80);

            [self.img1 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[0]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [self.img2 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[1]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];

        }
            break;
        
        case 3:
        {
            self.img4.hidden=YES;
            self.img3.hidden=NO;
            self.img2.hidden=NO;
            self.img1.hidden=NO;
            
            self.img1.frame=CGRectMake(0, 0, 38, 80);
            self.img2.frame=CGRectMake(42, 0, 38, 38);
            self.img3.frame=CGRectMake(42, 42, 38, 38);

            [self.img1 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[0]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [self.img2 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[1]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];

            [self.img3 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[2]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];

        }
            break;
        case 4:
        {
            
            self.img4.hidden=NO;
            self.img3.hidden=NO;
            self.img2.hidden=NO;
            self.img1.hidden=NO;
            
            self.img1.frame=CGRectMake(0, 0, 38, 38);
            self.img2.frame=CGRectMake(42, 0, 38, 38);
            self.img3.frame=CGRectMake(0, 42, 38, 38);
            self.img4.frame=CGRectMake(42, 42, 38, 38);
            
            [self.img1 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[0]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [self.img2 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[1]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [self.img3 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[2]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [self.img4 sd_setImageWithURL:[NSURL URLWithString:model.imgUrlArr[3]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
        }
            break;
        default:
            break;
    }

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
