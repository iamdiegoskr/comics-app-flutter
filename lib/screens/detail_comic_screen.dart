import 'package:comics_skr_app/widgets/card_swiper.dart';
import 'package:flutter/material.dart';

class DetailComic extends StatelessWidget {
  const DetailComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detalle del comic'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardSwiperComics(),
            TitleComic(),
            ContentComic(),
          ],
        ),
      )
    );
  }
}

class TitleComic extends StatelessWidget {
  const TitleComic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: const Text(
        'Titulo del comic',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}


class ContentComic extends StatelessWidget {
  const ContentComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
        bottom: 30
      ),
      width: double.infinity,
      child: Column(
        children: const [
          ComicDescription(),
          Divider(
            color: Colors.white,
          ),
          ContentDetails(),
        ],
      ),
    );
  }
}

class ComicDescription extends StatelessWidget {
  const ComicDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: const Text(
        'Aute exercitation eu exercitation et elit nisi aliqua aute. Pariatur non ullamco anim dolor eiusmod. Irure nisi commodo magna incididunt. Adipisicing laboris eu sit officia excepteur laborum culpa pariatur cupidatat. Sint excepteur consequat nulla cillum ut mollit incididunt in consectetur esse sunt fugiat.',
        textAlign: TextAlign.justify,
      )
    );
  }
}


class ContentDetails extends StatelessWidget {
  const ContentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Fecha lanzamiento : 23.04.97'),
          SizedBox(height: 12),
          Text('Precio : 7.9'),
          SizedBox(height: 12),
          Text('Personajes')
        ],
      ),
    );
  }
}