
import 'package:comics_skr_app/models/comic.dart';
import 'package:comics_skr_app/widgets/card_comic.dart';
import 'package:flutter/material.dart';

class ComicsPage extends StatelessWidget {

  List<Comic> comics;

  ComicsPage(
    {Key? key,
    required this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(comics.isEmpty){
      return const Center(
          child: CircularProgressIndicator(
            color: Colors.pink,
          ),
      );
    }

    return  Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: comics.length,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 0,
          mainAxisExtent: 240, // here set custom Height You Want
        ),
        itemBuilder: (BuildContext context , int index){
          return CardComic(comic:comics[index]);
        })
    );
  }
}




