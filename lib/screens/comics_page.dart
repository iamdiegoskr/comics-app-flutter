
import 'package:comics_skr_app/widgets/card_comic.dart';
import 'package:flutter/material.dart';

class ComicsPage extends StatelessWidget {
  const ComicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: 10,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 210, // here set custom Height You Want
        ),
        itemBuilder: (BuildContext context , int index){
          return CardComic();
        })
    );
  }
}




