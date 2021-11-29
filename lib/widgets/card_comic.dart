import 'package:flutter/material.dart';

class CardComic extends StatelessWidget {

  const CardComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, 'detail'),
      child: Container(
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
        ),
    );
  }
}