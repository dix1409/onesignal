import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class MainPremium extends StatefulWidget {
  const MainPremium({Key? key}) : super(key: key);

  @override
  State<MainPremium> createState() => _MainPremiumState();
}

class _MainPremiumState extends State<MainPremium> {
  bool isLoading=true;
  late  WebViewController _controller;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop : () async {
        if (await _controller.canGoBack()) {
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
                  initialUrl: 'https://compareprivateplanes.com/premium',
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
