import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:easy_alert/easy_alert.dart';
class AmapRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LocationGetState();
  }
}
String getLocationStr(AMapLocation loc) {
  if (loc == null) {
    return "正在定位";
  }

  if (loc.isSuccess()) {
    if (loc.hasAddress()) {
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
    } else {
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
    }
  } else {
    return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
  }
}
class _LocationGetState extends State {
  AMapLocation _loc;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Center(
          child: _loc == null
              ? new Text("正在定位")
              : new Text("定位成功:${_loc.formattedAddress}"),
        ));
  }

  void _checkPersmission() async {
    bool hasPermission =
    await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
      await SimplePermissions.requestPermission(
          Permission.WhenInUseLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Alert.alert(context, title: "申请定位权限失败");
        return;
      }
    }
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    AMapLocation loc = await AMapLocationClient.getLocation(true);
    setState(() {
      _loc = loc;
    });
  }

  @override
  void initState() {
    _checkPersmission();
    super.initState();
  }
  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }

}