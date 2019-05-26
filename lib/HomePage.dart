import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:live_data/ItemDesign.dart';
import 'package:live_data/movie_model/movie_base_data.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {

//  ItemDesign({this.movie , this.backgroundColor});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test101"),
          backgroundColor: Colors.red,
          leading: Icon(Icons.menu, size: 30.0, color: Colors.white,),
          actions: <Widget>[
            Icon(Icons.ac_unit, size: 30.0, color: Colors.white,),
          ],
        ),

        // MARK:- GridView
        body:
        FutureBuilder<BaseMovieModel>(
            future: fetchMovie(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: CircularProgressIndicator(strokeWidth: 10.0,backgroundColor: Colors.red));
              } else {
                return GridView.builder(
                    itemCount: snapshot.data.results.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context , postion)=>
                        GestureDetector(
                          child:ItemDesign(movie: snapshot.data.results[postion],
                            backgroundColor: colors[postion%colors.length],) ,
                          onTap: (){
                            //Navigator.of(context).push(
                               // MaterialPageRoute(builder: (c)=> full_View(movie: snapshot.data.results[postion])));
                          },

                        )
                );}
            }));

  }

  List<Color>
  colors=[
    Colors.blueAccent,
    Colors.red,
    Colors.yellow,
    Colors.indigo];

// MARK:- Calling Api ::fetching request
  Future<BaseMovieModel> fetchMovie() async {
    final response = await http.get(
        'http://api.themoviedb.org/3/movie/popular?api_key=ec298f72dc8c9ad364fda6f08cc2056e');

    //success case
    if (response.statusCode == 200) {
      return BaseMovieModel.fromJson(json.decode(response.body));
    } else {
      //Error
      throw Exception('faild');
    }
  }

}
