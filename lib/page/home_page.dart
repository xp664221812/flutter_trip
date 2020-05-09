import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertrip/dao/home_dao.dart';
import 'package:fluttertrip/model/common_model.dart';
import 'package:fluttertrip/model/home_model.dart';
import 'dart:convert';

import 'package:fluttertrip/widget/local_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://pages.c-ctrip.com/commerce/promote/201804/other/up/pc/img/n1_pic_01_1.jpg',
    'https://pages.c-ctrip.com/commerce/promote/201804/other/up/pc/img/n1_pic_03.jpg',
    'https://pages.c-ctrip.com/commerce/promote/201804/other/up/pc/img/n1_pic_05.jpg'
  ];

  double appBarAlpha = 0;
  String resultString = '';

  List<CommonModel> localNavList = [];

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    }
    if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });
    print(offset);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    HomeModel model = await HomeDao.fetch();

    try {
      setState(() {
        localNavList = model.localNavList;
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf2f2f2),
        body: Stack(
      children: <Widget>[
        Center(
            child: NotificationListener(
          onNotification: (ScrollNotification scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification &&

                ///监听第0个子元素
                scrollNotification.depth == 0) {
              _onScroll(scrollNotification.metrics.pixels);
            }
            return true;
          },
          child: ListView(
            children: <Widget>[
              Container(
                  height: 200,
                  child: Swiper(
                    itemCount: _imageUrls.length,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        _imageUrls[index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: SwiperPagination(),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                child: LocalNav(
                  localNavList: localNavList,
                ),
              ),
              Container(
                height: 800,
                child: ListTile(
                  title: Text(resultString),
                ),
              ),
            ],
          ),
        )),

        ///可以改变透明度
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
