import 'dart:convert';

class Characters {
    Characters({
        required this.available,
        required this.collectionUri,
        required this.returned,
    });

    int available;
    String collectionUri;
    int returned;

    factory Characters.fromJson(String str) => Characters.fromMap(json.decode(str));


    factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        returned: json["returned"],
    );

}