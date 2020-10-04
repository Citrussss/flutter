import 'package:arakawa/ui/article/article.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildContent(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_emoticon_sharp), label: "暂无")
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[800],
            onTap: (value) => setState(
                  () {
                    _selectedIndex = value;
                  },
                )));
  }

  List<Widget> item = [
    Article(),
    Center(
      child: Text("Empty"),
    )
  ];

  Widget buildContent(int selectedIndex) {
    return item[selectedIndex];
  }
}
