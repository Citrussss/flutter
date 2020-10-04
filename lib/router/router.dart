import 'package:arakawa/bean/article_list_entity.dart';
import 'package:arakawa/ui/article/article_detail.dart';
import 'package:flutter/cupertino.dart';

void routerArticle(BuildContext context, ArticleListDataData data) {
  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(
    builder: (context) => ArticleDetail(data),
  ));
}
