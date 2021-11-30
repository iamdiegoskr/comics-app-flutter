import 'package:card_swiper/card_swiper.dart';
import 'package:comics_skr_app/models/thumbail.dart';
import 'package:flutter/material.dart';


class CardSwiperComics extends StatelessWidget {

  List<Thumbnail> posters;

  CardSwiperComics({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    if(posters.isEmpty){
      return Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: size.height * 0.4,
        child: const Image(
          fit: BoxFit.cover,
          width: double.infinity,
          image: AssetImage('assets/marvel-logo.jpg')
        ),
      );
    }


    if(posters.length==1){
      return Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: size.height * 0.7,
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholder: 'assets/not-image.jpg',
          image: '${posters[0].path}.jpg',
        )
      );
    }

    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      height: size.height * 0.7,
      child: Swiper(
        //pagination: const SwiperPagination(),
        control: const SwiperControl(),
        itemCount: posters.length,
        layout: SwiperLayout.DEFAULT,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.8,
        itemBuilder: (BuildContext context, int index){
          return FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: 'assets/not-image.jpg',
            image: '${posters[index].path}.jpg',
          );
        },
      ),
    );
  }
}