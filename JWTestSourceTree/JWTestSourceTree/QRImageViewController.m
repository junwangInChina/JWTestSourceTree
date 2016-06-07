//
//  QRImageViewController.m
//  JWTestSourceTree
//
//  Created by wangjun on 16/6/7.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "QRImageViewController.h"

#import "UIImage+JWQRImage.h"

@interface QRImageViewController()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation QRImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.inputTextField.delegate = self;
    self.inputTextField.text = @"http://www.cloudm.com";
    [self updateRQImage:nil];
}

- (void)didReceiveMemoryWarning
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.inputTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self updateRQImage:nil];
    
    return YES;
}

- (IBAction)updateRQImage:(id)sender
{
    [self changeQRImage:self.inputTextField.text];
}

- (void)changeQRImage:(NSString *)string
{
    self.qrImageView.image = [UIImage JW_QRCodeImageWithString:string];
}

@end
