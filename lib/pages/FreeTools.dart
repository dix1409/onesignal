import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FreeToolsPage extends StatefulWidget {
  const FreeToolsPage({Key? key}) : super(key: key);

  @override
  State<FreeToolsPage> createState() => _FreeToolsPageState();
}

class _FreeToolsPageState extends State<FreeToolsPage> {
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
                initialUrl: 'https://compareprivateplanes.com/private-jet-free-tools',
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
