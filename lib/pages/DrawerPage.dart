import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/LoginPage.dart';
class DrawerBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DrawerBodyState();
  }

}
class _DrawerBodyState extends State<DrawerBody>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
  Widget _buildBody() {
    return new Column(
        children: <Widget>[
          _buildDrawer(),
          _buildList()
    ],);

  }
  Widget _buildDrawer() {
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
    );
  }
  Widget _buildList(){
    return new MediaQuery.removePadding(
      context: context,
      // DrawerHeader consumes top MediaQuery padding.
      removeTop: true,
      child: new Expanded(
          child: new ListView(
                  children: <Widget>[
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
                    )),
    );
  }

}
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new DrawerBody(),
    );
  }
}