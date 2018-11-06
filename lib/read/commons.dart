import 'package:flutter/material.dart';
import 'global_config.dart';
import 'search.dart';

Widget searchInput(String sign, BuildContext context) {
  return new Container(
    child: new Row(
      children: <Widget>[
        new Container(
          child: new Text(sign,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 2.0)),
          width: 60.0,
        ),
        new Expanded(
            child: new Container(
          height: 28.0,
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              new FlatButton(onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new SearchPage();
                    }
                ));
              }, child: new Text("搜索书名、作者、分类、标签"))
            ],
          ),
          decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
              color: GlobalConfig.searchBackgroundColor),
        ))
      ],
    ),
  );
}
