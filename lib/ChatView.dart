import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
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
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieCard(movies[index]);
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

