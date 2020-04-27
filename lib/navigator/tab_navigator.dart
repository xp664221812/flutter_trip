import 'package:flutter/material.dart';
import 'package:fluttertrip/page/home_page.dart';
import 'package:fluttertrip/page/my_page.dart';
import 'package:fluttertrip/page/search_page.dart';
import 'package:fluttertrip/page/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  PageController controller = PageController(initialPage: 0);
  var _defaultColor = Colors.grey;
  var _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          onPageChanged: (int page) {
            setState(() {
              _currentIndex = page;
            });
          },
          children: <Widget>[
            HomePage(),
            SearchPage(),
            TravelPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _defaultColor),
                activeIcon: Icon(Icons.home, color: _activeColor),
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex == 0 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: _defaultColor),
                activeIcon: Icon(Icons.search, color: _activeColor),
                title: Text(
                  '搜索',
                  style: TextStyle(
                      color: _currentIndex == 1 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera, color: _defaultColor),
                activeIcon: Icon(Icons.camera, color: _activeColor),
                title: Text(
                  '旅拍',
                  style: TextStyle(
                      color: _currentIndex == 2 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: _defaultColor),
                activeIcon: Icon(Icons.account_circle, color: _activeColor),
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex == 3 ? _activeColor : _defaultColor),
                )),
          ],
        ));
  }
}
