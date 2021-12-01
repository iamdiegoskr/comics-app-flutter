
import 'package:comics_skr_app/models/comic.dart';
import 'package:comics_skr_app/models/comic_favorite.dart';
import 'package:comics_skr_app/services/comics_favorites.dart';
import 'package:comics_skr_app/widgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailComic extends StatefulWidget {
  const DetailComic({Key? key}) : super(key: key);

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final comic = ModalRoute.of(context)!.settings.arguments as Comic;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detalle del comic')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperComics(posters:comic.images),
            //TitleComic(comic.title),
            ContentComic(comic:comic),
          ],
        ),
      )
    );
  }
}




class ContentComic extends StatefulWidget {

  final Comic comic;

  const ContentComic(
    {Key? key,
    required this.comic}) : super(key: key);

  @override
  State<ContentComic> createState() => _ContentComicState();
}

class _ContentComicState extends State<ContentComic> {

    late bool isFavorited;

    @override
    void initState() {
      isFavorited = false;
      super.initState();
    }

  @override
  Widget build(BuildContext context) {

    ComicsFavoriteService comicsFavoriteService = Provider.of<ComicsFavoriteService>(context);

    isFavorited = comicIsFavorited(comicsFavoriteService.listComicsFavorites, widget.comic.id);

    return Container(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
        bottom: 18
      ),
      width: double.infinity,
      child: Column(
        children: [
          TitleComic(widget.comic.title),
          const SizedBox(height: 12,),
          IconButton(
            onPressed: (){
                setState(() {
                  isFavorited = !isFavorited;

                  if (isFavorited) {
                    final comicFavorite = ComicFavorite(id: widget.comic.id, path: widget.comic.getFullPosterComic(), title: widget.comic.title);
                    comicsFavoriteService.addComicFavorite(comicFavorite);
                  }else{
                    ComicFavorite comicToRemove = getFavoritedComicToRemove(comicsFavoriteService.listComicsFavorites, widget.comic.id);
                    comicsFavoriteService.deleteComicFavorite(comicToRemove.idFirebase!);
                  }
                });
            }, icon: (isFavorited)
              ? const Icon(Icons.favorite, size: 36, color: Colors.pink)
              : const Icon(Icons.favorite_border_outlined, size: 36, color: Colors.pink)
          ),
          ComicDescription(widget.comic.description),
          const Divider(
            color: Colors.white,
          ),
          ContentDetails(widget.comic),
        ],
      ),
    );
  }
}

class TitleComic extends StatelessWidget {

  final String title;

  const TitleComic(this.title, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}

class ComicDescription extends StatelessWidget {

  String? description;

  ComicDescription(this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: (description!=null || description=='') ? Text(description!) : const Text('Descripcion no disponible...')
    );
  }
}


class ContentDetails extends StatelessWidget {

  final Comic comic;

  const ContentDetails(this.comic,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          DetailItem(
            title:'Fecha de lanzamiento',
            child: Text(comic.dates[0].date, style: const TextStyle(fontSize: 18))
          ),

          DetailItem(
            title:'Precio',
            child: Row(
              children: [
                Text(comic.prices[0].price.toString(), style: const TextStyle(fontSize: 18),),
                const Icon(Icons.attach_money, color: Colors.greenAccent, size: 32),
              ],
            )
          ),

        ],
      ),
    );
  }
}


class DetailItem extends StatelessWidget {

  final String title;
  final Widget child;

  const DetailItem({ required  this.title, required this.child});

  @override
  Widget build(BuildContext context) {

    const textTitleDetails = TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.orange
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTitleDetails),
        child,
        const SizedBox(height: 14,)
      ],
    );
  }
}

bool comicIsFavorited(List<ComicFavorite> listComicsFavorites, int id){

  for (var comic in listComicsFavorites) {
    if(comic.id == id){
      return true;
    }
  }

  return false;

}

getFavoritedComicToRemove(List<ComicFavorite> listComicsFavorites, int id){

    for (var comic in listComicsFavorites) {
      if(comic.id == id){
        return comic;
      }
    }

}