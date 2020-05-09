import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebView({Key key,
    this.url,
    this.statusBarColor,
    this.title,
    this.hideAppBar,
    this.backForbid})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewReference = FlutterWebviewPlugin();
  StreamSubscription<String> _streamSubscription;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    webViewReference.close();
    _streamSubscription = webViewReference.onUrlChanged.listen((String url) {});

    _onStateChanged =
        webViewReference.onStateChanged.listen((WebViewStateChanged state) {
          switch (state.type) {
            case WebViewState.startLoad:
              break;

            default:
              break;
          }
        });

    _onHttpError =
        webViewReference.onHttpError.listen((WebViewHttpError error) {});
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewReference.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
          _appBar(null, null),
            Expanded(

            )
      ],
    ),);
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,

      );
    }

    return Container(
      child: FractionallySizedBox( //会撑满宽度
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned( //绝对布局
                left: 0,
                right: 0,
                child: Text(widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
