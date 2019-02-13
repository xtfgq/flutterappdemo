import 'package:flutter/material.dart';
import 'SplashPage.dart';
import 'HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  Color _themeColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo',
      theme: new ThemeData(
        primaryColor: _themeColor,
      ),//样式
      home: new SplashPage(), // 闪屏页
      routes: <String, WidgetBuilder>{ // 路由
        '/HomePage': (BuildContext context) => new HomePage()
      },
    );
  }
}