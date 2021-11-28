import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiperComics extends StatelessWidget {
  const CardSwiperComics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: size.height * 0.7,
      // color: Colors.pink,
      child: Swiper(
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        itemCount: 10,
        layout: SwiperLayout.DEFAULT,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.8,
        itemBuilder: (BuildContext context, int index){
          return FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: 'assets/not-image.jpg',
            image: 'http://i.annihil.us/u/prod/marvel/i/mg/f/80/5a6648f8aaccc.jpg'
          );
        },
      ),
    );
  }
}