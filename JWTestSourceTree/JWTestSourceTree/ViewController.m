//
//  ViewController.m
//  JWTestSourceTree
//
//  Created by wangjun on 16/6/7.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tempTableView;
@property (strong, nonatomic) NSArray *tempArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tempArray = @[@{@"title":@"UIImage+JWQRImage",
                         @"content":@"方便生成二维码的UIImage类别",
                         @"class":@"QRImageViewController"},
                       @{@"title":@"UIColor+JWHexColor",
                         @"content":@"颜色类别",
                         @"class":@"HexColorViewController"},
                       @{@"title":@"NSDate+JWTime",
                         @"content":@"封装了许多日期的常用方法",
                         @"class":@"QRImageViewController"}];
    
    self.tempTableView.delegate = self;
    self.tempTableView.dataSource = self;
    [self.tempTableView setTableFooterView:[UIView new]];
    [self.tempTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ViewControllerIdentifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tempArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewControllerIdentifier" forIndexPath:indexPath];
    
    if (self.tempArray.count > indexPath.row)
    {
        cell.textLabel.text = self.tempArray[indexPath.row][@"title"];
        cell.detailTextLabel.text = self.tempArray[indexPath.row][@"content"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.tempArray.count <= indexPath.row) return;
    
    UIStoryboard *currentSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *nextController = [currentSB instantiateViewControllerWithIdentifier:self.tempArray[indexPath.row][@"class"]];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
