import 'package:flutter/material.dart';
import 'commons.dart';
import 'global_config.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: searchInput('分类', context),
        ),
        body: new Text("CategoryPage"),
      ),
    );
  }
}
