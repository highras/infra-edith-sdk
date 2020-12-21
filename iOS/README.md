
SDK 接入说明
=
系统要求
-

   *  支持系统iOS10以上

SDK支持
-
   *  包含armv7,armv7s,arm64,i386,x86_64指令集, 可运行真机 + 模拟器 

集成依赖
-

   *  引入头文件 #import <FPCustomerSDK/FPCustomerSDK.h>
   
   *  拖入Data文件夹（点击 create folder references ）
    
   *  info.plist 添加  Privacy - Photo Library Usage Description  相册权限
                 添加  Privacy - Camera Usage Description  相机权限
         
    
接口
-

    1.初始化

    +(BOOL)fpCustomerInitWithAppid:(NSInteger)appId                     //必传
                                    userId:(NSString * _Nonnull)userId          //必传
                                    appKey:(NSString * _Nonnull)appKey          //必传
                                    gameLanguage:(NSString * _Nonnull)gameLanguage    //必传
                                    gameId:(NSString * _Nullable)gameId
                                    userName:(NSString * _Nullable)userName
                                    serverId:(NSString * _Nullable)serverId
                                    networkType:(NSString * _Nullable)networkType
                                    tags:(NSArray<NSString*> * _Nullable)tags
                                    vipLevel:(NSInteger)vipLevel
                                    custom:(NSDictionary * _Nullable)custom
                                    domain:(NSString * _Nonnull)domain
                                    pushDeviceToken:(NSString * _Nullable)pushDeviceToken;
                                    
    2.faq调用
                                   
    if ([FPCustomerManager shareInstance].initFinish) {
        FPNavigationController * nav = [[FPNavigationController alloc] initWithRootViewController:[FPFaqTypeViewController new]];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    3.智能机器人

    if ([FPCustomerManager shareInstance].initFinish) {
    
    
    FPCustomerSmartServiceViewController * vc = [FPCustomerSmartServiceViewController
                                                 initWithAppId:[FPCustomerManager shareInstance].appId
                                                 appKey:[FPCustomerManager shareInstance].appKey
                                                 userId:[FPCustomerManager shareInstance].userId
                                                 userName:[FPCustomerManager shareInstance].userName
                                                 gameId:[FPCustomerManager shareInstance].gameId
                                                 gameLang:[FPCustomerManager shareInstance].gameLanguage
                                                 vipLevel:[FPCustomerManager shareInstance].vipLevel];
    
    
   
    FPNavigationController * nav = [[FPNavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
    
   }

    4.拉取是否有未读
    
    [FPCustomerManager getUnreadStatus:^(BOOL result) {
        
        
    }];

 

