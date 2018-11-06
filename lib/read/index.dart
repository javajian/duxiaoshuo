import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bookshelf.dart';
import 'category.dart';
import 'me.dart';
import 'bookcity.dart';
import 'navigation_icon_view.dart';
import 'global_config.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IndexState();
}

class IndexState extends State<Index> with TickerProviderStateMixin {
  int _tabIndex = 0;
  List<StatefulWidget> _pageList;
  StatefulWidget _body;

  List<NavigationIconView> _navigationViews;

  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  var tabImages;
  var appBarTitles = ['书架', '书城', '分类', '我的'];

//  Image getTabImage(path) => new Image.asset(path, width: 25.0, height: 25.0);

  void initData() {
    _pageList = <StatefulWidget>[
      new BookShelfPage(),
      new CategoryPage(),
      new BookCityPage(),
      new MePage()
    ];
    _body = _pageList[_tabIndex];

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.book),
        title: new Text("书架"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.category),
        title: new Text("分类"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.library_books),
        title: new Text("书城"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        title: new Text("我的"),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) =>
                navigationIconView.item)
            .toList(),
        currentIndex: _tabIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _navigationViews[_tabIndex].controller.reverse();
            _tabIndex = index;
            _navigationViews[_tabIndex].controller.forward();
            _body = _pageList[_tabIndex];
          });
        });

    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        body: _body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
