//
//  ViewController.m
//  Example
//
//  Created by fp on 2019/11/19.
//  Copyright © 2019 FunPlus. All rights reserved.
//

#import "ViewController.h"
#import "FPCustomerServiceManager.h"
#import <FPCustomerService/FPCustomerService.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    lb.center = self.view.center;
    lb.text = @"点击屏幕";
    lb.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:lb];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [FPCustomerServiceManager showFPCustomerService:[UIApplication sharedApplication].keyWindow.rootViewController];
}



@end
