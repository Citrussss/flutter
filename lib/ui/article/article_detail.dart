import 'package:arakawa/bean/article_list_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatefulWidget {
  ArticleListDataData _data;

  ArticleDetail(this._data);

  @override
  State<StatefulWidget> createState() => _State(_data);
}

class _State extends State {
  ArticleListDataData _data;

  _State(this._data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_data.title),),
      body: Container(
        child: WebView(
          initialUrl:_data.link,
        ),
      ),
    );
  }
}
