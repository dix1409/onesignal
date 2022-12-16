import 'package:compareprivateplanesapp/models/Article.dart';
import 'package:compareprivateplanesapp/pages/article_details.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  bool isLoading=true;
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop : () async {
        if (await _controller.canGoBack()) {
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
                  initialUrl: 'https://compareprivateplanes.com/all-artices',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller = webViewController;
                  },
                  onPageFinished: (url) {
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
