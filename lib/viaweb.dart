import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class via extends StatefulWidget {
  const via({Key? key}) : super(key: key);

  @override
  _viaState createState() => _viaState();
}

class _viaState extends State<via> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Via Bilgisayar'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://via.tc/',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
