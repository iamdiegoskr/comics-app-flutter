
import 'dart:convert';

class ComicFavorite {
    ComicFavorite({
        required this.id,
        required this.path,
        required this.title,
    });

    int id;
    String path;
    String title;
    String? idFirebase;

    factory ComicFavorite.fromJson(String str) => ComicFavorite.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ComicFavorite.fromMap(Map<String, dynamic> json) => ComicFavorite(
        id: json["id"],
        path: json["path"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "path": path,
        "title": title,
    };
}
