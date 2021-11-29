import 'dart:convert';


class Thumbnail {

    Thumbnail({
        required this.path
    });

    String path;

    factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

    factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"]
    );
}