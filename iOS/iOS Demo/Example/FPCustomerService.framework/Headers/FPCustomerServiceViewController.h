

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPCustomerServiceViewController : UIViewController

//info.plist 添加 Privacy - Camera Usage Description Privacy - Photo Library Usage Description

+ (instancetype)initWithAppId:(NSInteger)appId          //唯一标识,从客服后台获取 必传
                       appKey:(NSString *)appKey        //唯一密钥,从客服后台获取 必传
                       userId:(NSString *)userId        //设置玩家id
                     userName:(NSString *)userName      //设置玩家名称
                       gameId:(NSString *)gameId        //设置游戏id
                  gameVersion:(NSString *)gameVersion   //设置游戏版本
                     gameLang:(NSString *)gameLang      //设置游戏语言
                     vipLevel:(NSInteger)vipLevel;      //设置vip等级
                    

@property(nonatomic,assign)UIInterfaceOrientation orientation;//方向 不设置默认为自动
@property(nonatomic,copy)void (^startLoadHandle)(void); //可在此添加： 相册相机权限处理 添加loadView等
@property(nonatomic,copy)void (^finishLoadHandle)(void);


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
