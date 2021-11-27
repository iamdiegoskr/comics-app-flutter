import 'package:flutter/material.dart';

class ComicsPage extends StatelessWidget {
  const ComicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: 10, //TODO. comics.length
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 210, // here set custom Height You Want
        ),
        itemBuilder: (BuildContext context , int index){
          return const CardComic();
        })
    );
  }
}


class CardComic extends StatelessWidget {
  const CardComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                placeholder: 'assets/spinning-loading.gif',
                image: 'https://via.placeholder.com/200x300'
              ),
            ),
            const SizedBox(height: 12),
            const Text('Title.comic',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      );
  }
}

