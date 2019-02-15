import 'package:flutter/material.dart';
import 'package:zoomable_image/zoomable_image.dart';

class ImageViewDetail extends StatefulWidget  {
  final String url;
  ImageViewDetail({this.url});
  @override
  State<StatefulWidget> createState() {
    return new _ImageViewDetail();
  }
}
class _ImageViewDetail extends State<ImageViewDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        // 去掉导航栏下面的阴影
        elevation: 0.0,
        title: new Text('缩放图片'),
      ),
      body: new Center(
              child: new ZoomableImage(
              new NetworkImage('${widget.url!= null ? widget.url : ''}'),
              scale: 16.0 ),
          )
    );
  }

}