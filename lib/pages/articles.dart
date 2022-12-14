import 'package:compareprivateplanesapp/models/Article.dart';
import 'package:compareprivateplanesapp/pages/article_details.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final myController = TextEditingController();

  Article article1 = Article(imagePath: "assets/images/all_articles_page_cesna.png", articleTitle: "Cessna Citation Family of Private Jets");
  Article article2 = Article(imagePath: "assets/images/all_articles_page_your_guide.png", articleTitle: "Your Guide to Private Jet Bathrooms");
  Article article3 = Article(imagePath: "assets/images/all_articles_page_private_jet.png", articleTitle: "Private Jet Onboard Catering");
  Article article4 = Article(imagePath: "assets/images/home_page_about_contact_image.png", articleTitle: "Tools");


  String searchString = "";


  @override
  Widget build(BuildContext context) {
    WebViewController _controller;


    List<Article> articleList = <Article>[];
    articleList.add(article1);
    articleList.add(article2);
    articleList.add(article3);
    articleList.add(article4);


    return  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
          child: SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: 'https://compareprivateplanes.com/all-artices',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
              ),
            ),
          ],
        )
    );
  }
}
