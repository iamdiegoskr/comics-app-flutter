import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ComicsProvider extends ChangeNotifier{
//Mi provedor de informacion..

  String baseUrl = 'gateway.marvel.com';
  String ts = '1';
  String apikey = 'ae1d2b5c0b8d73ae295e212eaae5090e';
  String hash = '89ddd3f5aa47a68f8e70d9c8596d2a0a';

  List<dynamic> listComics = [];


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

    var jsonResponse =
        convert.jsonDecode(responseData) as Map<String, dynamic>;

    return jsonResponse['data']['results'];

  }

}