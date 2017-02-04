//
//  ViewController.m
//  test
//
//  Created by test on 2016/11/23.
//  Copyright © 2016年 test. All rights reserved.
//
//639 405

#import "ViewController.h"
#import "EnlargedImage.h"

#define iamgeWidth  165
#define imageHeight 110  //原图大小

#define imageTag    10

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view];

    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, iamgeWidth, imageHeight)];
    imageView.image = [UIImage imageNamed:@"0.jpg"];
    imageView.tag = imageTag;
    [cell addSubview:imageView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return imageHeight+10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView = [cell viewWithTag:imageTag];
    [EnlargedImage enlargedImage:imageView enlargedTime:0.5]; //使用
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
