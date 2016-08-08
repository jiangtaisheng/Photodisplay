//
//  ViewController.m
//  Photodisplay
//
//  Created by apple2015 on 16/5/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "ViewController.h"
#import "PhotoModel.h"
#import "TakePicCell.h"
#import "PhotoCell.h"
#import "PhotoTextCell.h"
#import "UIImageView+WebCache.h"
#import "PhotoDisplayController.h"
#define SelfView_H ([UIScreen mainScreen].bounds.size.height)
#define SelfView_W ([UIScreen mainScreen].bounds.size.width)
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView * scrollview;
    UIView *_playView;
    CGFloat lastScale;
}
@property(nonatomic,strong)NSMutableArray * datasource;
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    [self.view  addSubview:self.tableView];

}

- (NSMutableArray *)datasource
{
    if (_datasource==nil) {
        _datasource=[NSMutableArray array];
    }
    return _datasource;
}

- (void)loadData
{

    NSURL * url=[[NSBundle mainBundle]URLForResource:@"test" withExtension:@"plist"];
    
    NSArray * arr=[[NSArray alloc]initWithContentsOfURL:url];

    
    PhotoModel * model = [[PhotoModel alloc]init];
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dayformatter=[[NSDateFormatter alloc] init];
    [dayformatter setDateFormat:@"dd"];
    NSString * dayString=[dayformatter stringFromDate:senddate];
    
    NSDateFormatter  * monthformatter2=[[NSDateFormatter alloc] init];
    [monthformatter2 setDateFormat:@"MM"];
    NSString * monthString=[monthformatter2 stringFromDate:senddate];

    model.dayStr = dayString;
    model.monthStr = monthString;
    
    [self.datasource addObject:model];
    
    for (int i=0 ;i<arr.count;i++) {
        
        NSDictionary * dic=arr[i];
        PhotoModel * model = [[PhotoModel alloc]init];
        model.tid = dic[@"tid"];
        model.articStr = dic[@"content"];
        NSString * postTime = dic[@"postTime"];
        model.dayStr = [postTime substringWithRange:NSMakeRange(8, 2)];
        model.monthStr = [postTime substringWithRange:NSMakeRange(5, 2)];
        model.imgUrlArr = dic[@"imgList"];

        PhotoModel * tempModel=[self.datasource lastObject];
        if ([tempModel.monthStr isEqualToString:model.monthStr]&&[tempModel.dayStr isEqualToString:model.dayStr])
        {
            
            model.isShowLB=YES;
        }
        else
        {
            model.isShowLB=NO;
        }
        
         [_datasource addObject:model];
        
        
    }

}


-(UITableView*)tableView
{
    
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
    
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PhotoModel * model=self.datasource[indexPath.row];
    
    if (indexPath.row==0) {
        
        TakePicCell * cell=[TakePicCell cellWithTableView:tableView];
        return cell;
    }
    else
    {
    
        if (model.imgUrlArr.count==0)
        {
            
            PhotoTextCell * cell=[PhotoTextCell cellWithTableView:tableView];
           
            cell.model=model;
            return cell;
        }
        else{
        
        
            PhotoCell * cell=[PhotoCell cellWithTableView:tableView];
        
            cell.model=model;
            return cell;
        }
      
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PhotoModel * model=self.datasource[indexPath.row];
    
    if (indexPath.row==0) {
        
        return 90;
        
    }else
    {
    
        if (model.imgUrlArr.count==0)
        {
           return    [PhotoTextCell heightForBubbleWithObject:model];
            
        }
        else{
        
            return 90;
        
        }

    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    PhotoModel * model=self.datasource[indexPath.row];
    if (model.imgUrlArr.count>0) {
        PhotoDisplayController * vc=[[PhotoDisplayController alloc]init];
        vc.currentIndex=0;
        vc.imgArr=[NSMutableArray arrayWithArray:model.imgUrlArr];
        [self presentViewController:vc animated:YES completion:nil];
    }

}

@end
