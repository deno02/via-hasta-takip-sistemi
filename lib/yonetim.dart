import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class yonetim extends StatefulWidget {
  @override
  _yonetimState createState() => _yonetimState();
}

class _yonetimState extends State<yonetim> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yönetim Paneli'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'http://hastatakip.via.tc/',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
