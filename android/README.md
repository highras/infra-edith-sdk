# EdithWebView-Android-SDK

### 接入说明
* 在Android工程的AndroidManifest.xml，增加需要的配置  
	```xml
	<uses-sdk android:minSdkVersion="14" />
	```
	* 网络权限,如果已经有,则不需要添加该配置  
		```xml
		<uses-permission android:name="android.permission.INTERNET" />
		```
	* 增加activity  
		```xml  
		<activity  
		android:name="com.ilivedata.edith.webview.WebViewActivity"  
		android:configChanges="screenSize|keyboardHidden|orientation">  
		</activity>  
		```

* 将[edithwebview.jar](https://github.com/highras/infra-edith-sdk/tree/master/android/libs)包拷贝到工程app中的libs文件夹下

* SDK初始化(须在app启动的时候调用):  
	* import com.ilivedata.edith.webview.CustomerServiceDataHelper;
	* `init接口`:
		* CustomerServiceDataHelper.getInstance().init(Activity context, int appId, String appKey, String userId);  
			* @param context 应用的Activty  
			* @param appId 唯一标识,从客服控制台获取  
			* @param appKey 唯一密钥,从客服控制台获取  
			* @param userId 用户id，此时获取不到userId可传入""

		* CustomerServiceDataHelper.getInstance().init(Activity context, int appId, String appKey, String userId, String userName, String gLang, int level, String gId, String gVersion);  
			* @param context 应用的Activty  
			* @param appId 唯一标识,从客服控制台获取  
			* @param appKey 唯一密钥,从客服控制台获取  
			* @param userId 用户id  
			* @param userName 用户名称  
			* @param gLang 游戏中的语言  
			* @param userName 用户名称  
			* @param level vip等级  
			* @param gId  游戏id  
			* @param gVersion 游戏版本

	* `接口说明`:  
		* 建议使用第二种接口传入游戏相关数据,如果有些数据初始化的时候获取不到,则可以使用第一种,调用第一种初始化后,在合适的地方建议使用如下接口设置一次相关用户数据:  
			* 设置游戏语言: CustomerServiceDataHelper.getInstance().setLang(String gLang);  
			* 设置玩家id: CustomerServiceDataHelper.getInstance().setUid(String id);  
			* 设置vip等级: CustomerServiceDataHelper.getInstance().setVipLevel(int level);  
			* 设置玩家名称: CustomerServiceDataHelper.getInstance().setUserName(String userName);  
			* 设置游戏id: CustomerServiceDataHelper.getInstance().setGameId(String id);  
			* 设置游戏版本: CustomerServiceDataHelper.getInstance().setGameVersion(String version);

* 调用show接口,启用智能客服聊天页面  
	* import com.ilivedata.edith.webview.WebViewActivity;  
	* WebViewActivity.show(boolean landScape);  
		* @param landScape  横竖屏设置, 传入true为横屏,false为竖屏,客服界面将始终是设置的,不会进行旋转  
		
### 一个例子
```java
package com.example.edith;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.view.View;

import android.view.Window;
import android.view.WindowManager;
import com.ilivedata.edith.webview.CustomerServiceDataHelper;
import com.ilivedata.edith.webview.WebViewActivity;


public class MainActivity extends AppCompatActivity {
    private Button btn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        super.onCreate(savedInstanceState);
        CustomerServiceDataHelper.getInstance().init(this, xxxx, "xxxxxxxxxxxxx", "111", "2222", "en", 2, "farm1", "1.0.1");
        setContentView(R.layout.activity_main);
        btn = (Button) findViewById(R.id.button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                WebViewActivity.show(true);
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
```
