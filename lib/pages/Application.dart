import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'index/IndexDrawPage.dart';

import 'home/HomePage.dart';
import 'classify/ClassifyPage.dart';
import 'mine/MinePage.dart';

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int page = 0;
  String title = GlobalConfig.homeTab;
  PageController pageController;

  //定义底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(GlobalConfig.homeTab),
        backgroundColor: Colors.lightBlue),
    new BottomNavigationBarItem(
        icon: Icon(Icons.tune),
        title: Text(GlobalConfig.classyTab),
        backgroundColor: Colors.lightBlue),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(GlobalConfig.mineTab),
        backgroundColor: Colors.lightBlue),
  ];

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        drawer: new Drawer(
          child: new IndexDrawPage(
            email: GlobalConfig.email,
            name: GlobalConfig.authorNice,
            profileimg: "images/profile_2.jpg",
            background: "images/bg_2.jpg",
          ),
        ),
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[HomePage(), ClassifyPage(), MinePage()],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: _bottomTabs,
            currentIndex: page,
            fixedColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            onTap: onTap),
      ),
    );
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = GlobalConfig.homeTab;
          break;
        case 1:
          title = GlobalConfig.classyTab;
          break;
        case 2:
          title = GlobalConfig.mineTab;
          break;
      }
    });
  }
}
