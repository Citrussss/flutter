import 'package:arakawa/bean/article_list_entity.dart';
import 'package:arakawa/bean/search_result_entity.dart';
import 'package:arakawa/router/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class SearchResult extends StatefulWidget {
  final String wordKey;

  const SearchResult({Key key, this.wordKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State(wordKey);
}

class _State extends State<SearchResult> {
  final String wordKey;
  bool _Isloading = true;
  SearchResultData paging;
  List<ArticleListDataData> list = new List();
  ScrollController _controller = new ScrollController();

  _State(this.wordKey);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //滚动视图已到达底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print("滚到底部");
        _loadMore();
      }
    });
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          child: Center(
            child: Loading(
              indicator: BallPulseIndicator(),
              size: MediaQuery.of(context).size.width / 5,
              color: Colors.blue.shade200,
            ),
          ),
          offstage: !_Isloading,
        ),
        Offstage(
          child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) => _buildItem(index),
              itemCount: list.length,
              controller: _controller,
            ),
            onRefresh: () => _refresh(),
          ),
          offstage: _Isloading,
        )
      ],
    );
  }

  Widget _buildItem(int index) {
    return _searchResultItem(list[index]);
  }

  Widget _searchResultItem(ArticleListDataData data) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 15, top: 7.5, end: 15, bottom: 7.5),
              child: Stack(
                children: [Text(data.title)],
              ),
            ),
            onTap: () {
              routerArticle(context, data);
              // onTapped(data);
            },
          ),
        ),
      ),
    );
  }

  _refresh() {
    list.clear();
    _Isloading = true;
    _loadData(0);
  }

  _loadMore() {
    if (paging != null) {
      _loadData(paging.curPage);
    }
  }

  _loadData(int page) async {
    var response = await Dio().post(
        'https://www.wanandroid.com/article/query/$page/json',
        queryParameters: {"k": wordKey});
    var searchResultEntity = SearchResultEntity().fromJson(response.data);
    this.paging = searchResultEntity.data;
    list.addAll(searchResultEntity.data.datas);
    _Isloading = false;
    setState(() {});
    print(response);
  }
}
