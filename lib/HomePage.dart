import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/person/PersonPage.dart';
import 'ContactView.dart';
import 'package:my_flutter_app/MeView.dart';
import 'ChatView.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final List<BottomNavigationBarItem> listSet = [new BottomNavigationBarItem(
    icon: new Icon(Icons.chat,color: Colors.grey),title: new Text("微信"),),
  new BottomNavigationBarItem(icon: new Icon(Icons.perm_contact_calendar,color: Colors.grey,),title: new Text("通讯录"),),
  new BottomNavigationBarItem(icon: new Icon(Icons.perm_identity,color: Colors.grey),title: new Text("我"),),
  ];
  final List<StatefulWidget> vcSet = [new ChatView(),new ContactView(),new PersonPager()];
  int _sindex=0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(items: listSet,type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _sindex = index;
          });
          print("____$index");
        },
        currentIndex: _sindex,
      ),
      body: vcSet[_sindex],
    );
  }

}
