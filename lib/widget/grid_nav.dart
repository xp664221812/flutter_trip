import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertrip/model/common_model.dart';
import 'package:fluttertrip/model/grid_nav_model.dart';
import 'package:fluttertrip/widget/webview.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;

  const GridNav({Key key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }

  _gridItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) {
      return items;
    }

    if (gridNavModel.hotel != null) {}
    if (gridNavModel.flight != null) {}
    if (gridNavModel.travel != null) {}
  }

  _gridNavItem(BuildContext context, GridNavItem item, bool isFirst) {
    List<Widget> items = [];
    items.add(_mainItem(context, item.mainItem))
  }

  _mainItem(BuildContext context, CommonModel model) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WebView(
                        title: model.title,
                        url: model.url,
                        statusBarColor: model.statusBarColor,
                        hideAppBar: model.hideAppBar,
                      )));
        },
        child: Stack(
          children: <Widget>[
            Image.network(
              model.icon,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Text(
              model.title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ));
  }

  _doubleItem(BuildContext context, CommonModel topModel,
      CommonModel bottomModel, bool isCenter) {
    return Column(
      children: <Widget>[
        Expanded(child: _item)
      ],
    );
  }

  _item(BuildContext context, CommonModel model, bool isFirst, bool isCenter) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: borderSide,
                bottom: isFirst ? borderSide : BorderSide.none
            )
        ),
        child: Center(child: Text(model.title, textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14))),
      ),
    );
  }

}
