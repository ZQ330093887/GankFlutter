# GankFlutter

一款追求全新用户体验的干货集中营 flutter 版 客户端
- [GitHub IOS版本](https://github.com/ZQ330093887/GankIOSProgect)
- [GitHub 小程序版本](https://github.com/ZQ330093887/GankWX)
- [GitHub Android版本](https://github.com/ZQ330093887/ConurbationsAndroid)

## 应用截图

| ![1](https://upload-images.jianshu.io/upload_images/3278692-49ee97b13c954c7f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) | ![2](https://upload-images.jianshu.io/upload_images/3278692-86a01b954f47b677.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) | ![3](https://upload-images.jianshu.io/upload_images/3278692-c40528ed4748938a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) | ![4](https://upload-images.jianshu.io/upload_images/3278692-5674f9df10aa7b86.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) | ![5](https://upload-images.jianshu.io/upload_images/3278692-9bfa67e12c7f9ab6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) |
| :--: | :--: | :--: | :--: | :--: |
| 每日干货 | 分类干货 | 个人中心 | 福利社区 | 历史车轮|
### 编译运行流程

1、配置好Flutter开发环境(目前Flutter SDK 版本 v0.5.8 的 Tag )，可参阅 [【搭建环境】](https://flutterchina.club)。

2、clone代码，执行`Packages get`安装第三方包。(因为某些不可抗力原因，国内可能需要设置代理: 
[代理环境变量](https://flutterchina.club/setup-windows/))
3、android studio、XCode、VScode、IDEA都可以


## 特别感谢

- API提供：[@代码家](https://github.com/daimajia)
- [干货集中营](http://gank.io/)

## 期待

- 如果您在使用过程中发现BUG或者觉得有何不合适，欢迎 issues me!
- 如果老铁觉得还可以，麻烦点个star支持一下,谢谢了!
- [简书](https://www.jianshu.com/u/9681f3bbb8c2)

## 学习资料
- 官方的 [Flutter官方地址](https://flutter.io/get-started/install/)
- 国内翻译版本 [Flutter中文网](https://flutterchina.club/)
- [Flutter 完整开发实战详解(一、Dart 语言和 Flutter 基础)](https://juejin.im/entry/5b631e3e51882519861c2ef1 )
-  [Flutter 完整开发实战详解(二、快速实战篇)](https://juejin.im/entry/5b685bd4e51d451994602cae )
-  [Flutter 完整开发实战详解(三、打包填坑篇)](https://juejin.im/entry/5b6fd5ee6fb9a009d36a4104 )
-  [Flutter 完整开发实战详解(四、 Redux、主题、国际化)](https://juejin.im/post/5b79767ff265da435450a873 )

### 第三方框架

当前 Flutter SDK 版本 v0.5.8（这些第三方库我在项目中用到了部分，这里收集起来，共大家找起来方便）

库 | 功能
-------- | ---
**dio**|**网络框架**
**shared_preferences**|**本地数据缓存**
**fluttertoast**|**toast**
**flutter_redux**|**redux**
**device_info**|**设备信息**
**connectivity**|**网络链接**
**flutter_markdown**|**markdown解析**
**json_annotation**|**json模板**
**json_serializable**|**json模板**
**url_launcher**|**启动外部浏览器**
**iconfont**|**字库图标**
**share**|**系统分享**
**flutter_spinkit**|**加载框样式**
**get_version**|**版本信息**
**flutter_webview_plugin**|**全屏的webview**
**sqflite**|**数据库**
**flutter_statusbar**|**状态栏**
**flutter_svg**|**svg**
**photo_view**|**图片预览**
**flutter_slidable**|**侧滑**

官方的Demo及各个Widget的效果在安装了Flutter SDK之后在  Flutter SDK安装目录/flutter/examples下，可以自己一一尝试。

## flutter （MAC）环境搭建
    输入命令：

    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    git clone -b dev https://github.com/flutter/flutter.git
    export PATH="$PWD/flutter/bin:$PATH"
    cd ./flutter
    flutter doctor

## 已优化问题

- 首页banner优化：提升banner加载图片的速度
- 图片优化：福利图片列表加载图片和图片详情展示图片性能提升70%
- UI以及交互优化：页面跳转，展示交互相对提升
- 优化下拉刷新，上拉加载样式和加载中交互
- 首页、分类页 添加缓存功能
- iOS机器上不卡顿，在Android机器上存在卡顿（解决中……）
- 注册、登录、分享功能暂未实现（进行中……）

### 更新日志
- 3.1.5
    - 更新库文件，优化首页banner
    - 优化代码，调整重构首页
- 3.1.4
    - 服务端接口发生变化，首页业务逻辑改变
    - 解决一个因为异步刷新导致的崩溃问题（该问题困扰我很长时间，终于解决了）
- 3.1.3
    - 自定义日历控件
    - 新增历史车轮页面，通过日历展示哪天有干货
    - 新增展示某日干货页面，点击日历查询日期对应的干货信息
- 3.1.2
    - 分类列表页添加缓存，优化用户体验
    - 首页banner，item各自添加缓存功能
- 3.1.1 
    - 首页banner优化
    - 福利图片加载图片优化新能提示70%
    - 查看图片交互效果优化
    - 优化搜索
    - 图片带缓存
- 3.1.0 UI风格大调整，全新的 UI 风格（里程碑）
- 3.0.0
    - 1.优化刷新样式，提升交互效果
    - 2.新增搜索功能
    - 3.解决应用启动白屏的问题,改变主界面UI，增强用户体验
- 2.0.0 完善业务逻辑，避免造轮子
- 1.0.0 发布成功

