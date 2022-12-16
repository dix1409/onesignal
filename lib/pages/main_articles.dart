
import 'package:compareprivateplanesapp/main.dart';
import 'package:compareprivateplanesapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainArticles extends StatefulWidget {
  const MainArticles({Key? key}) : super(key: key);

  @override
  State<MainArticles> createState() => _MainArticlesState();
}

class _MainArticlesState extends State<MainArticles> {
  bool isLoading=true;
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          print("onwill goback");
          _controller.goBack();
        }else{
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
                initialUrl: 'https://compareprivateplanes.com/article-categories',
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
    ));

  }
}
