import 'package:flutter/material.dart';
import 'commons.dart';
import 'global_config.dart';

class BookCityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BookCityPageState();
}

class BookCityPageState extends State<BookCityPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: searchInput('书城', context),
        ),
        body: new Text("BookShelfPage"),
      ),
    );
  }
}
