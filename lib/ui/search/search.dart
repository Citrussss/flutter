import 'package:arakawa/ui/search/search_result.dart';
import 'package:arakawa/ui/search/search_tip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(
      wordKey: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchTip(
      search: (data) {
        query = data.name;
        showResults(context);
      },
    );
  }
}
