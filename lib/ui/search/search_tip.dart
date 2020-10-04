import 'package:arakawa/bean/hot_key_bean_entity.dart';
import 'package:arakawa/widget/flow/flow.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTip extends StatefulWidget {
  final void Function(HotKeyBeanData data) search;

  const SearchTip({Key key, this.search}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State(search);
}

class _State extends State<SearchTip> {
  final void Function(HotKeyBeanData data) search;

  List<HotKeyBeanData> _data = new List();

  _State(this.search);

  @override
  void initState() {
    super.initState();
    _loadHotKey();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowNormal(),
      children: _data
          .map((item) => ActionChip(
                label: Text(item.name),
                onPressed: () => search(item),
              ))
          .toList(),
    );
  }

  _loadHotKey() async {
    var response = await Dio().get("https://www.wanandroid.com//hotkey/json");
    var hotKeyBeanEntity = HotKeyBeanEntity().fromJson(response.data);
    print(response.data);
    _data.clear();
    _data.addAll(hotKeyBeanEntity.data);
    setState(() {});
  }
}
