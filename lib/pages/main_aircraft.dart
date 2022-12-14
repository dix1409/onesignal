import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainAircraft extends StatefulWidget {
  const MainAircraft({Key? key}) : super(key: key);

  @override
  State<MainAircraft> createState() => _MainAircraftState();
}

class _MainAircraftState extends State<MainAircraft> {
  bool isLoading=true;
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
