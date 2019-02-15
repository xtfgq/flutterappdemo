import 'package:flutter/material.dart';
import 'package:my_flutter_app/PageScaffold.dart';
import 'package:my_flutter_app/ui/LoginPage.dart';
class SlideLeftView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SlideLeftView();
  }

}
class _SlideLeftView extends State<SlideLeftView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('侧滑菜单'),
          centerTitle:true,
        ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('CYC'), //用户名
                accountEmail: new Text('example@126.com'),  //用户邮箱
                currentAccountPicture: new GestureDetector( //用户头像
                  onTap: () =>Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new LoginPage()),
                  ),
                  child: new CircleAvatar(    //圆形图标控件
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/'
                        'upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/'
                        'strip|imageView2/1/w/240/h/240'),//图片调取自网络
                  ),
                )
            ),
            new ListTile(
              title: new Text("识花"),
              trailing: new Icon(Icons.local_florist),
            ),
            new ListTile(
              title: new Text("搜索"),
              trailing: new Icon(Icons.search),
            ),
            new Divider(),
            new ListTile(
              title: new Text("设置"),
              trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );

  }


}