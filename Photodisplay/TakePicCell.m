//
//  TakePicCell.m
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "TakePicCell.h"

@implementation TakePicCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell2";
    TakePicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TakePicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    self.dayLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 80)];
    self.dayLB.font=[UIFont systemFontOfSize:30];
    self.dayLB.text=@"今天";
    [self addSubview:self.dayLB];
    
    self.takePicBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.takePicBtn.frame= CGRectMake(100, 10, 80, 80);
    [self.takePicBtn setBackgroundImage:[UIImage imageNamed:@"ph_posted.png"] forState:UIControlStateNormal];
    [self addSubview:self.takePicBtn];
    
    
    
}

- (void)setModel:(PhotoModel *)model
{

   
    _model=model;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
