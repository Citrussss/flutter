import 'package:arakawa/bean/article_list_entity.dart';
import 'package:arakawa/bean/banner_entity.dart';
import 'package:arakawa/ui/search/search.dart';
import 'package:banner_view/banner_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

//文章列表
class ArticleList extends StatefulWidget {
  final void Function(ArticleListDataData data) onTapped;

  ArticleList({this.onTapped});

  @override
  State<StatefulWidget> createState() => _State(onTapped: onTapped);
}

class _State extends State {
  final void Function(ArticleListDataData data) onTapped;
  List<BannerData> _bannerData = new List();
  List<ArticleListDataData> _articleData = new List();
  ArticleListData _page;
  ScrollController _scrollController = new ScrollController();
  bool _IsLoading = true;

  _State({this.onTapped});

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //滚动视图已到达底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("滚到底部");
        _loadMore();
      }
    });
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    int childCount = 0;
    if (_articleData.isNotEmpty) {
      childCount += _articleData.length;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("文章列表"),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 15, top: 15, end: 15, bottom: 15),
              child: Icon(Icons.search),
            ),
            onTap: () =>
                showSearch(context: context, delegate: SearchBarDelegate()),
            // onTap: () => Navigator.of(context, rootNavigator: true)
            //         .push(CupertinoPageRoute(
            //       builder: (context) => Search(),
          )
        ],
      ),
      body: Stack(
        children: [
          Offstage(
            child: Center(
              child: Loading(
                indicator: BallPulseIndicator(),
                color: Colors.blue.shade200,
                size: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
              ),
            ),
            offstage: !_IsLoading,
          ),
          Offstage(
            child: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, index) => _buildItem(index),
                itemCount: childCount,
                controller: _scrollController,
              ),
              onRefresh: () => _refresh(),
            ),
            offstage: _IsLoading,
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Future<void> _refresh() async {
    _IsLoading = true;
    Iterable<Future> jobs = [_httpBanner(), _httpArticleList(0)];
    await Future.wait(jobs);
    _IsLoading = false;
    setState(() {});
  }

  _httpBanner() async {
    try {
      Response response =
      await Dio().get("https://www.wanandroid.com/banner/json");
      var data = BannerEntity()
          .fromJson(response.data)
          .data;
      this._bannerData.clear();
      this._bannerData.addAll(data);
    } catch (e) {
      print(e);
    }
  }

  _httpArticleList(int page) async {
    try {
      var response =
      await Dio().get("https://www.wanandroid.com/article/list/$page/json");
      if (page == 0) {
        this._articleData.clear();
      }
      this._page = ArticleListEntity()
          .fromJson(response.data)
          .data;
      this._articleData.addAll(this._page.datas);
    } catch (e) {
      print(e);
    }
  }

  _buildItem(int index) {
    if (index == 0) {
      return LayoutBuilder(
        builder: (context, constraints) =>
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .width / 375 * 208,
              child: BannerView(
                _bannerData
                    .map((item) =>
                    Image.network(
                      item.imagePath,
                      fit: BoxFit.fitWidth,
                    ))
                    .toList(),
              ),
            ),
      );
    } else {
      return _articleItem(_articleData[index - 1]);
    }
  }

  Widget _articleItem(ArticleListDataData data) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) =>
            Container(
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
                  onTapped(data);
                },
              ),
            ),
      ),
    );
  }

  void _loadMore() async {
    if (_page != null && _page.curPage <= _page.total) {
      await _httpArticleList(_page.curPage);
      setState(() {});
    }
  }
}
