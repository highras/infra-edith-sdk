# EdithWebView-Android-SDK

智能客服Android sdk接入文档

1.在Android工程的AndroidManifest.xml，增加需要的配置：
	<uses-sdk android:minSdkVersion="14" />
	# 网络权限,如果已经有,则不需要添加该配置
	<uses-permission android:name="android.permission.INTERNET" />
	# 增加activity
	<activity
        android:name="com.ilivedata.edith.webview.WebViewActivity"
        android:configChanges="screenSize|keyboardHidden|orientation">
    </activity>

2.将edithwebview.jar包拷贝到工程app中的libs文件夹下.

3.SDK初始化(须在app启动的时候调用):
	import com.ilivedata.edith.webview.CustomerServiceDataHelper;

	初始化的接口:
	1. CustomerServiceDataHelper.getInstance().init(Activity context, int appId, String appKey, String userId);
		@param context 应用的Activty
		@param appId 唯一标识,从后台获取
		@param appKey 唯一密钥,从客服后台获取
		@param userId 用户id，此时获取不到userid可传入空

	2.CustomerServiceDataHelper.getInstance().init(Activity context, int appId, String appKey, String userId, String userName, String gLang, int level, String gId, String gVersion)
		@param context 应用的Activty
		@param appId 唯一标识,从后台获取,测试阶段可设置为0
		@param appKey 唯一密钥,从客服后台获取,测试阶段可设置为空
		@param userId 用户id
		@param userName 用户名称
		@param gLang 游戏中的语言
		@param level vip等级
		@param gId  游戏id
		@param gVersion 游戏版本

	# 接口说明:建议使用第二种接口传入游戏相关数据,如果有些数据初始化的时候获取不到,则可以使用第一种,调用第一种初始化后,在合适的地方建议使用如下接口设置一次相关用户数据:
		1.设置游戏语言: CustomerServiceDataHelper.getInstance().setLang(String gLang);
		2.设置玩家id: CustomerServiceDataHelper.getInstance().setUid(String id);
		3.设置vip等级: CustomerServiceDataHelper.getInstance().setVipLevel(int level);
		4.设置玩家名称: CustomerServiceDataHelper.getInstance().setUserName(String userName);
		5.设置游戏id: CustomerServiceDataHelper.getInstance().setGameId(String id);
		6.设置游戏版本: CustomerServiceDataHelper.getInstance().setGameVersion(String version);

4.客服接口说明:
	1.调用show接口,启用智能客服聊天页面
		import com.ilivedata.edith.webview.WebViewActivity;

		WebViewActivity.show(boolean landScape);
		 @param landScape  横竖屏设置, 传入true为横屏,false为竖屏,客服界面将始终是设置的,不会进行旋转


