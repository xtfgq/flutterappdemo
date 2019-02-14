import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flukit/flukit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flutter_app/ui/ProgressView.dart';
class ChatView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChatPage();
  }
}

class _ChatPage  extends State<ChatView>{
  List movies;
  Future<String> _getDatas() async {
    String url =
        "https://www.bilibili.com/index/recommend.json";
    String request = await http.get(url).then((http.Response response){
      print(response.body);
      List list = json.decode(response.body)['list'];
      print(list);
      setState(() {
        movies= list.map((json) => Movie.fromJson(json)).toList();
      });
    });
    return request;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle:true,
      ),
      body: movies == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        child: ListView.builder(
          itemCount: movies.length+1,
          itemBuilder: (BuildContext context, int index) {
            if(index==0){
              return BannerWidget(movies);
            }else {
              return MovieCard(movies[index-1]);
            }
          },
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _getDatas();
  }
}
class BannerWidget extends StatelessWidget{
  List movies;
  BannerWidget(this.movies);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Swiper(
        indicatorAlignment: AlignmentDirectional.topEnd,
        circular: true,
        interval: const Duration(seconds: 2),
        indicator: NumberSwiperIndicator(),
        children: movies.map((model) {
          return new InkWell(
            onTap: () {
            },
            child: new CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: model.pic,
              errorWidget: new Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );

  }

}

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: InkWell(
          onTap: () {
            print(movie.pic);
          },
          child: Column(
              children: <Widget>[
                Image.network(
                  movie.pic,
                  fit: BoxFit.cover,
                ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Population: ${movie.description}",
                          style: TextStyle(
                            fontSize: 11.0,
                          ),
                        ),
                      ]
                  )
              ]

          ),
        )
    );
  }

}
  class Movie{
     final String title;
     final String pic;
     final int play;
     final String description;
     Movie({
       this.title,
       this.pic,
       this.play,
       this.description,
     });
     factory Movie.fromJson(Map<String, dynamic> json) {
       return Movie(
         title: json['title'] as String,
         pic: json['pic'] as String,
         play: json['play'] as int,
         description: json['description'] as String,
       );
     }


}
class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}

