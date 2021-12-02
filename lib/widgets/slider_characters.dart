import 'package:comics_skr_app/models/character_response.dart';
import 'package:comics_skr_app/provider/comics_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharactersSlider extends StatelessWidget {

  final int comicId;

  const CharactersSlider({Key? key, required this.comicId}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    ComicsProvider comicsProvider = Provider.of<ComicsProvider>(context);

    return FutureBuilder(
      future: comicsProvider.getCharactersByComic(comicId),
      builder: (BuildContext context, AsyncSnapshot<List<Character>> snapchot){

        if(!snapchot.hasData){
          return const SizedBox(
            height: 280,
            child: CupertinoActivityIndicator(),
          );
        }

        if(snapchot.data!.isNotEmpty){
            return SizedBox(
            width: double.infinity,
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text('Personajes'),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapchot.data!.length,
                    itemBuilder: (BuildContext context, int index){

                      final character = snapchot.data![index];

                      return CardCharacter(image: '${character.thumbnail.path}.jpg', name: character.name );
                    }),
                ),
              ],
            ),
        );
        }else{
          return Container();
        }
      }
    );
  }
}

class CardCharacter extends StatelessWidget {

  String image;
  String name;

  CardCharacter(
    {Key? key,
    required this.image,
    required this.name
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage.assetNetwork(
              height: 190,
              fit: BoxFit.cover,
              placeholder: 'assets/loading-load.gif',
              image: image
            ),
          ),
          const SizedBox(height: 14,),
          Text(name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,)
        ],
      ),
    );
  }
}