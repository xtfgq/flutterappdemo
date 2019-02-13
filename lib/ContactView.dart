import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ContactView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ContactPage();
  }
}

class _ContactPage  extends State<ContactView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        centerTitle:true,
      ),
    );
  }
}