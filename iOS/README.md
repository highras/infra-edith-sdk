
SDK 接入说明

1.系统要求

    支持系统iOS9以上

2.SDK支持

    包含armv7,armv7s,arm64,i386,x86_64指令集, 可运行真机 + 模拟器 

3.集成依赖

    info.plist 添加  Privacy - Photo Library Usage Description  相册权限
               添加  Privacy - Camera Usage Description  相机权限
                 
    引入头文件 #import <FPCustomerService/FPCustomerService.h>
    
4.接口

    + (instancetype)initWithAppId:(NSInteger)appId        //唯一标识,从客服后台获取 必传
         appKey:(NSString *)appKey        //唯一密钥,从客服后台获取 必传
         userId:(NSString *)userId        //设置玩家id
       userName:(NSString *)userName      //设置玩家名称
         gameId:(NSString *)gameId        //设置游戏id
    gameVersion:(NSString *)gameVersion   //设置游戏版本
       gameLang:(NSString *)gameLang      //设置游戏语言
       vipLevel:(NSInteger)vipLevel;      //设置vip等级
   
    @property(nonatomic,assign)UIInterfaceOrientation orientation;//方向 不设置默认为自动
    present 对象为 UINavigationController 支持固定方向需要重写 FPOrientationNavigationController (demo提供) 内的方法
    push 不支持固定方向
    @property(nonatomic,copy)void (^startLoadHandle)(void); //可在此处理：   例：相册相机权限提示语处理 添加loadView 等
    @property(nonatomic,copy)void (^finishLoadHandle)(void); 
    
代码示例

    FPCustomerServiceViewController * vc = [FPCustomerServiceViewController
                                          initWithAppId:1
                                                 appKey:@"1"
                                                 userId:@"userId"
                                               userName:@"userName"
                                                 gameId:@"gameId"
                                            gameVersion:@"1.1.1"
                                               gameLang:@"en"
                                               vipLevel:1];
                                               
    if (vc != nil) {
        FPOrientationNavigationController* nav = [[FPOrientationNavigationController alloc]initWithRootViewController:vc];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        vc.navigationItem.leftBarButtonItem = backItem;
        vc.title = @"客服系统";
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }
    -(void)back{
        [self dismissViewControllerAnimated:YES completion: nil];
    }
 

