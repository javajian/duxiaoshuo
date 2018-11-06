import 'package:flutter/material.dart';
import 'commons.dart';
import 'global_config.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookShelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BookShelfPageState();
}

class BookShelfPageState extends State<BookShelfPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<String> list = <String>[];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: searchInput('书架', context),
        ),
        body: new RefreshIndicator(
          child: new ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: this.list.length,
              itemBuilder: (_, int index) => _createItem(list[index])),
          onRefresh: _getData,
          key: _refreshIndicatorKey,
        ),
      ),
    );
  }

  _createItem(String title) {
    return new Column(
      children: <Widget>[
        new Container(
          height: 24.0,
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: new Text(title),
        ),
        Divider(
          height: 0.5,
        )
      ],
    );
  }

  Future<Null> _getData() {
    final Completer<Null> completer = new Completer<Null>();

    // 启动一下 [Timer] 在3秒后，在list里面添加一条数据，关完成这个刷新
    new Timer(Duration(seconds: 3), () {
      // 添加数据，更新界面
      setState(() {
        list.add("新加数据${list.length}");
      });

      // 完成刷新
      completer.complete(null);
    });

    return completer.future;
  }
}
