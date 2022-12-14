import 'dart:io';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AirCraft extends StatefulWidget {
  const AirCraft({Key? key}) : super(key: key);

  @override
  State<AirCraft> createState() => _AirCraftState();
}

class _AirCraftState extends State<AirCraft> {
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;


    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
          child: SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
        ),
      body: Stack(
        children: [
          Expanded(
            child: WebView(
                  initialUrl: 'https://compareprivateplanes.com/find',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller = webViewController;
                    },
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      )
    );
  }
}
