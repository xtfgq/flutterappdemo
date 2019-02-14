import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MePage();
  }
}

class _MePage  extends State<MeView>{
  List<String> titles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titles = List<String>();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
        centerTitle:true,
      ),
    );
  }
}