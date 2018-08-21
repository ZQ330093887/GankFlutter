const String wx = '微信好友';
const String wx_circle = '微信朋友圈';
const String sina = '新浪微博';
const String msg = '短信';
//const String qq = 'QQ好友';
//const String q_zone = 'QQ空间';
//const String copy_url = '复制链接';
//const String browser = '浏览器打开';

class Menu {
  final int index;
  final String title;
  final String icon;

  const Menu({this.index, this.title, this.icon});
}

const List<Menu> menus_share = const <Menu>[
  const Menu(index: 0, title: wx, icon: "images/icon_wx.png"),
  const Menu(index: 1, title: wx_circle, icon: "images/icon_circle.png"),
  const Menu(index: 2, title: sina, icon: "images/icon_sina.png"),
  const Menu(index: 3, title: msg, icon: "images/icon_msg.png"),
];

const List<Menu> menus_login = const <Menu>[
  const Menu(index: 0, title: wx, icon: "images/icon_wx.png"),
  const Menu(index: 1, title: sina, icon: "images/icon_sina.png"),
];
