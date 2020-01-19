//
//  FPCustomerServiceManager.m
//  Test
//
//  Created by zsl on 2019/12/2.
//  Copyright © 2019 张世良. All rights reserved.
//

#import <FPCustomerService/FPCustomerService.h>
#import "FPCustomerServiceManager.h"

@implementation FPCustomerServiceManager
+(void)showFPCustomerService:(UIViewController*)rootVc{
    FPCustomerServiceViewController * vc = [FPCustomerServiceViewController
                                              initWithAppId:0
                                                     appKey:@"appKey"
                                                     userId:@"userId"
                                                   userName:@"userName"
                                                     gameId:@"gameId"
                                                gameVersion:@"1.1.1"
                                                   gameLang:@"en"
                                                   vipLevel:1];
    //    vc.startLoadHandle = ^{
    //        // do something
    //    };
    //    vc.finishLoadHandle = ^{
    //        // do something
    //    };
        
        //vc.orientation = UIInterfaceOrientationLandscapeRight;//不设置 为自动方向
        //present 对象为 UINavigationController 支持固定方向需要重写 FPOrientationNavigationController内的方法
        if (vc != nil) {
            FPOrientationNavigationController* nav = [[FPOrientationNavigationController alloc]initWithRootViewController:vc];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nav action:@selector(back)];
            vc.navigationItem.leftBarButtonItem = backItem;
            vc.title = @"客服系统";
            [rootVc presentViewController:nav animated:YES completion:^{
            
            }];
        }
}
@end


@implementation FPOrientationNavigationController
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (BOOL)shouldAutorotate{
    
    return [[self.viewControllers lastObject] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

-(BOOL)prefersStatusBarHidden{
    
    return [[self.viewControllers lastObject] prefersStatusBarHidden];
}

-(void)setNeedsStatusBarAppearanceUpdate{
    
}
@end
