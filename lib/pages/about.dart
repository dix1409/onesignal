import 'package:flutter/material.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  String webUrlPage = "https://compareprivateplanes.com/about";
  late WebViewController _controller;

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = <Widget>[AboutPage(),ContactPage()];

    return Scaffold(


      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedButtonBar(
                radius: 32.0,
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.blueGrey.shade800,
                foregroundColor: Colors.blueGrey.shade300,
                elevation: 24,
                borderColor: Colors.white,
                borderWidth: 2,
                innerVerticalPadding: 16,
                children: [
                  ButtonBarEntry(onTap: () {
                    webUrlPage = "https://compareprivateplanes.com/about";
                    setState(() {
                      currentIndex = 0;
                    });
                  }, child: Text("About",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ButtonBarEntry(onTap: () {
                  webUrlPage = "https://compareprivateplanes.com/contact";
                  setState(() {
                    currentIndex = 1;
                  });
                  }, child: Text("Contact",style: TextStyle(color: Colors.white,fontSize: 15),)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 85,
            child: pages[currentIndex]
          ),
        ],
      ),
    );
  }
}


class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: "https://compareprivateplanes.com/about",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
        },
      ),
    );
  }
}



class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: "https://compareprivateplanes.com/contact",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
        },
      ),
    );
  }
}

