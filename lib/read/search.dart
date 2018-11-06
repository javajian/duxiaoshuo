import 'package:flutter/material.dart';

import 'global_config.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Widget searchInput() {
    return new Container(
      height: 35.0,
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: new Icon(Icons.arrow_back, color: GlobalConfig.fontColor),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "搜索书名、作者、分类、标签",
                  hintStyle: new TextStyle(color: GlobalConfig.fontColor)),
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
          color: GlobalConfig.searchBackgroundColor),
    );
  }

  List<String> searchHistory = [
    '一念永恒',
    '龙王传说',
    '啊啊',
    '分额',
    '魔道祖师',
    '我的1941',
    '完美世界',
    '巫神纪',
    '择天记',
    '牧神记',
    '武动乾坤',
    '斗破苍穹',
    '唐家三少',
    '我吃西红柿',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈',
    '娃哈哈'
  ];

  List<Widget> buildItem() {
    List<Widget> lists = new List();
    for (var item in searchHistory) {
      lists.add(new Container(
        height: 30.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: new Row(
          children: <Widget>[
            new Icon(
              Icons.history,
              color: Colors.white70,
            ),
            new Text(
              item,
              style: new TextStyle(fontSize: 16.0, color: Colors.white70),
            )
          ],
        ),
      ));
    }
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: searchInput(),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(child: new Text('大家搜在搜')),
//                  new FlatButton.icon(onPressed: null, icon: null, label: new Text('换一换')),
                  new Container(
                    child: new FlatButton.icon(
                      onPressed: null,
                      label: new Text('换一换'),
                      icon: new Icon(Icons.refresh),
                    ),
                  )
                ],
              ),
              new Wrap(
                spacing: 5.0,
                direction: Axis.horizontal,
                children: <Widget>[
                  new Chip(label: new Text('一念永恒')),
                  new Chip(label: new Text('校花的贴身高手')),
                  new Chip(label: new Text('圣墟')),
                  new Chip(label: new Text('魔道祖师')),
                  new Chip(label: new Text('朕心爱的丑姑娘')),
                  new Chip(label: new Text('非常非常长的名字非常非常非常长长长长长长')),
                  new Chip(label: new Text('一念永恒'))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Expanded(child: new Text('搜索历史')),
                  new Container(
                    child: new FlatButton.icon(
                      onPressed: null,
                      label: new Text('清空'),
                      icon: new Icon(Icons.delete_forever),
                    ),
                  ),
                ],
              ),
              new Column(
                children: buildItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
