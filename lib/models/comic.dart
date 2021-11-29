
import 'dart:convert';

import 'package:comics_skr_app/models/characters.dart';
import 'package:comics_skr_app/models/comic_date.dart';
import 'package:comics_skr_app/models/creators.dart';
import 'package:comics_skr_app/models/price.dart';
import 'package:comics_skr_app/models/thumbail.dart';

class Comic {
    Comic({
        required this.id,
        required this.digitalId,
        required this.title,
        required this.issueNumber,
        required this.variantDescription,
        this.description,
        required this.modified,
        required this.pageCount,
        required this.resourceUri,
        required this.dates,
        required this.prices,
        required this.thumbnail,
        required this.images,
        required this.creators,
        required this.characters,
    });

    int id;
    int digitalId;
    String title;
    int issueNumber;
    String variantDescription;
    String? description;
    String modified;
    int pageCount;
    String resourceUri;
    List<Date> dates;
    List<Price> prices;
    Thumbnail thumbnail;
    List<Thumbnail> images;
    Creators creators;
    Characters characters;

    factory Comic.fromJson(String str) => Comic.fromMap(json.decode(str));

    factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"],
        pageCount: json["pageCount"],
        resourceUri: json["resourceURI"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        images: List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
    );


    getFullPosterComic(){
      return '${thumbnail.path}.jpg';
    }

}
