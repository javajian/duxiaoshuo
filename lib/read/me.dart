import 'package:flutter/material.dart';
import 'global_config.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MePageState();
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        body: new Text("CategoryPage"),
      ),
    );
  }
}
