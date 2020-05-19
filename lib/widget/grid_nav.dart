import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertrip/model/common_model.dart';
import 'package:fluttertrip/model/grid_nav_model.dart';

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

  _gridNavItem(BuildContext context, GridNavItem item, bool isFirst) {}

  _mainItem(BuildContext context, CommonModel model) {
    return GestureDetector(
        onTap: () {

        },
        child: Stack(
          children: <Widget>[
            Image.network(model.icon,
              height: 88, width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Text(model.title, style: TextStyle(
              fontSize: 14,
              color: Colors.white
            ),)
          ],
        )
    )
  }
}
