import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/PageScaffold.dart';
import 'package:my_flutter_app/ui/AmapRoute.dart';
import 'package:my_flutter_app/ui/SlideLeftView.dart';
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
        body: ListPage([
          //PageInfo("test", (ctx) => TestRoute()),
          PageInfo("地图定位", (ctx) => AmapRoute()),
          PageInfo("侧滑菜单", (ctx) => SlideLeftView(),false),
        ]));

  }
}