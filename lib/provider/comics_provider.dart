
import 'package:comics_skr_app/models/character_response.dart';
import 'package:comics_skr_app/models/comic.dart';
import 'package:comics_skr_app/models/comics_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ComicsProvider extends ChangeNotifier{
//Mi provedor de informacion..

  String baseUrl = 'gateway.marvel.com';
  String ts = '1';
  String apikey = 'ae1d2b5c0b8d73ae295e212eaae5090e';
  String hash = '89ddd3f5aa47a68f8e70d9c8596d2a0a';

  List<Comic> listComics = [];

  Map<int, List<Character>> characters = {};


  ComicsProvider(){
    print('Comics provider initilize');
    getAllComics();
  }

  Future<String> _getJsonData(String endpoint,) async {

    var url = Uri.https(baseUrl, endpoint, {
        'limit' : '100',
        'ts': ts,
        'apikey': apikey,
        'hash': hash
      }
    );

    var response = await http.get(url);

    return response.body;
  }

  getAllComics() async{
    print('Obteniendo los comics');

    final responseData = await _getJsonData('v1/public/comics');
    final comicsResponse = ComicsResponse.fromJson(responseData);

    listComics = comicsResponse.data.results;
    notifyListeners();

  }


  Future<List<Character>> getCharactersByComic(int idComic) async{

    var url = Uri.https(baseUrl, 'v1/public/comics/$idComic/characters', {
        'ts': ts,
        'apikey': apikey,
        'hash': hash
      });

      var response = await http.get(url);

      CharactersResponse character = CharactersResponse.fromJson(response.body);

      characters[idComic] = character.data.results;

      return character.data.results;

  }





}