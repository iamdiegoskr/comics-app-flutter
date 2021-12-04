import 'dart:convert';

import 'package:comics_skr_app/models/thumbail.dart';

class CharactersResponse {
    CharactersResponse({
        required this.code,
        required this.status,
        required this.copyright,
        required this.attributionText,
        required this.attributionHtml,
        required this.etag,
        required this.data,
    });

    int code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    String etag;
    Data data;

    factory CharactersResponse.fromJson(String str) => CharactersResponse.fromMap(json.decode(str));

    factory CharactersResponse.fromMap(Map<String, dynamic> json) => CharactersResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromMap(json["data"]),
    );
}

class Data {
    Data({
        required this.offset,
        required this.limit,
        required this.total,
        required this.count,
        required this.results,
    });

    int offset;
    int limit;
    int total;
    int count;
    List<Character> results;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
    );
}

class Character {
    Character({
        required this.id,
        required this.name,
        required this.description,
        required this.modified,
        required this.thumbnail,
    });

    int id;
    String name;
    String description;
    String modified;
    Thumbnail thumbnail;
    factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

    factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"])
    );
}
