import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                height: 800,
                child: ListTile(
                  title: Text('测试'),
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

