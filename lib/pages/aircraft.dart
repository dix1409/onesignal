import 'dart:io';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class AirCraft extends StatefulWidget {
  const AirCraft({Key? key}) : super(key: key);

  @override
  State<AirCraft> createState() => _AirCraftState();
}

class _AirCraftState extends State<AirCraft> {
  bool isLoading=true;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop : () async {
        if (await _controller.canGoBack()) {
          print("onwill goback");
          _controller.goBack();
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: ""),));
        }
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}
