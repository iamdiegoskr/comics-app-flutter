
import 'dart:convert';

import 'package:comics_skr_app/models/comic_favorite.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ComicsFavoriteService extends ChangeNotifier{

  final baseUrl = 'comicsskeitapp-default-rtdb.firebaseio.com';

  List<ComicFavorite> listComicsFavorites = [];

  ComicsFavoriteService(){
    getFavoritesComics();
  }

  getFavoritesComics() async {

    listComicsFavorites = [];

    var url =
      Uri.https(baseUrl, 'comicsFavorites.json');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body) ?? [] as Map<String, dynamic> ;

    jsonResponse.forEach((key, value) {
      var tempComic = ComicFavorite.fromMap(value);
      tempComic.idFirebase = key;
      listComicsFavorites.add(tempComic);
    });
    notifyListeners();
  }


  addComicFavorite(ComicFavorite comicFavorite) async{

    final url =
      Uri.https(baseUrl, 'comicsFavorites.json');

    final response = await  http.post(url, body: comicFavorite.toJson());
    final decodedData = json.decode(response.body);
    comicFavorite.idFirebase = decodedData['name'];

    listComicsFavorites.add(comicFavorite);
    notifyListeners();

  }


  deleteComicFavorite(String idComic) async {

    final url =
      Uri.https(baseUrl, 'comicsFavorites/$idComic.json');
    final response = await http.delete(url);

    getFavoritesComics();

  }

}