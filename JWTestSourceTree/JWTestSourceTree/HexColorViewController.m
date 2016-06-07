//
//  HexColorViewController.m
//  JWTestSourceTree
//
//  Created by wangjun on 16/6/7.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "HexColorViewController.h"

#import "UIColor+JWHexColor.h"

@interface HexColorViewController()
@property (weak, nonatomic) IBOutlet UILabel *tempLabel1;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel2;

@end

@implementation HexColorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tempLabel1.textColor = [UIColor JW_ColorWithHexString:@"f7ff65"];
    self.tempLabel2.textColor = [UIColor JW_ColorWithHexString:@"f8f9f3" alpha:0.4];
}



@end
