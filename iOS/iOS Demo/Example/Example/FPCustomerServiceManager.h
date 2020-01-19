//
//  FPCustomerServiceManager.h
//  Test
//
//  Created by zsl on 2019/12/2.
//  Copyright © 2019 张世良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface FPCustomerServiceManager : NSObject
+(void)showFPCustomerService:(UIViewController*)rootVc;

@end


@interface FPOrientationNavigationController : UINavigationController
- (void)back;
@end


