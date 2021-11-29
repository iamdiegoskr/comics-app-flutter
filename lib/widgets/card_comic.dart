import 'package:comics_skr_app/models/comic.dart';
import 'package:flutter/material.dart';

class CardComic extends StatelessWidget {

  final Comic comic;

  const CardComic({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    comic.getFullPosterComic();

    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, 'detail'),
      child: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: 165,
                  fit: BoxFit.cover,
                  placeholder: 'assets/spinning-loading.gif',
                  image: comic.getFullPosterComic(),
                ),
              ),
              const SizedBox(height: 12),
              Text(comic.title,
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