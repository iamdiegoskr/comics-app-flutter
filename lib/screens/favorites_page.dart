import 'package:comics_skr_app/models/comic_favorite.dart';
import 'package:comics_skr_app/services/comics_favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {

  List<ComicFavorite> favorites;

  FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ComicsFavoriteService comicsFavoriteService = Provider.of<ComicsFavoriteService>(context);

    if(favorites.isEmpty){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


    if(comicsFavoriteService.listComicsFavorites.isEmpty){
      return Center(
        child: Text('No hay comics favoritos'),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index){
          return FavoriteComicCard(comic : favorites[index]);
        }),
    );
  }
}

class FavoriteComicCard extends StatelessWidget {

  final ComicFavorite comic;

  const FavoriteComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ComicsFavoriteService comicsFavoriteService = Provider.of<ComicsFavoriteService>(context);


    return Container(
      //margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          ListTile(
            title: Text(comic.title),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(comic.path),
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context){
                    return AlertDialog(
                      title: const Text('ELIMINAR DE FAVORITOS?', textAlign: TextAlign.center,),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      content: SingleChildScrollView(
                      child: ListBody(
                        children:  const <Widget>[
                          Image(
                            width: 100,
                            image: AssetImage('assets/original.gif')
                          ),
                        ],
                      ),
                    ),
                      actions: <Widget>[
                      TextButton(
                        child: const Text('Cancelar', style: TextStyle(color: Colors.red), ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Aceptar',style: TextStyle(color: Colors.blue.shade400)  ),
                        onPressed: () {
                          comicsFavoriteService.deleteComicFavorite(comic.idFirebase!);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    );
                  }
                );
              },
              icon : Icon(Icons.close, color: Colors.red.shade400),)
          ),
          const SizedBox(height: 12,),
          const Divider(height: 12, color: Colors.white, )
        ],
      ),
    );
  }
}

