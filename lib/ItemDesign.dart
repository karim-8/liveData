import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_data/movie_model/Movie.dart';

class ItemDesign extends StatefulWidget {

  Movie movie;
  Color backgroundColor;
  ItemDesign({this.movie , this.backgroundColor});

  @override
  ItemDesignState createState() {
    return new ItemDesignState();
  }
}

class ItemDesignState extends State<ItemDesign> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},

      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(

              decoration: BoxDecoration(image: DecorationImage(
                  image: NetworkImage(
                      "http://image.tmdb.org/t/p/w185/" +
                          widget.movie.poster_path)
                  , fit: BoxFit.cover
              ),
              )
          ),
          Positioned(
              bottom: -5,
              right: -5,
              left: -5,
              height: 60,
              child: Container(
                decoration:
                BoxDecoration(color: widget.backgroundColor??Colors.red),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: ListTile(
                        leading: Container(
                          width: ((MediaQuery
                              .of(context)
                              .size
                              .width) /
                              3.5),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.movie.title,
                                style: TextStyle(
                                    color: Colors.white),
                                softWrap: false,
                              ),
                              Text(widget.movie.overview,
                                  style: TextStyle(
                                      color: Colors.white),
                                  softWrap: false),
                            ],
                          ),
                        ),
                        trailing: IconButton(

                            icon: Icon(
                              Icons.favorite,
                              color: checked?Colors.green:Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                checked = !checked;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),

    );
  }
}
