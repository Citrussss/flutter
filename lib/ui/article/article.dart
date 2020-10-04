import 'package:arakawa/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_list.dart';

class Article extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Article> {
  // ArticleListDataData _data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WanAndroid",
      home: Navigator(
        pages: [
          MaterialPage(
              child: ArticleList(
            onTapped: (data) => routerArticle(context, data),
          )),
          // if (_data != null)
          //   MaterialPage(child: ArticleDetail(_data), fullscreenDialog: true)
        ],
        onPopPage: (route, result) {
          return false;
        },
      ),
    );
  }
}
