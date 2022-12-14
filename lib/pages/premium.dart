import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
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
                initialUrl: 'https://compareprivateplanes.com/sign-in',
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

/*
* Column(
      children: [
        /*SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                    AssetImage("assets/images/header_default_image2.png"),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Premium Zone",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ))
            ],
          ),
        ),*/
        Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: 'http://compareprivateplanes.com/sign-in',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
              ),
            ),
          ],
        )

      ],
    );*/