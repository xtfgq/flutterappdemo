import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ChatView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChatPage();
  }
}

class _ChatPage  extends State<ChatView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle:true,
      ),
    );
  }
}