import 'dart:convert';

import 'package:comics_skr_app/models/enum_values.dart';

class Creators {
    Creators({
        required this.available,
        required this.collectionUri,
        required this.items,
        required this.returned,
    });

    int available;
    String collectionUri;
    List<CreatorsItem> items;
    int returned;

    factory Creators.fromJson(String str) => Creators.fromMap(json.decode(str));


    factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
    );
}

class CreatorsItem {
    CreatorsItem({
        required this.resourceUri,
        required this.name,
        this.role,
    });

    String resourceUri;
    String name;
    Role? role;

    factory CreatorsItem.fromJson(String str) => CreatorsItem.fromMap(json.decode(str));

    factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: roleValues.map[json["role"]],
    );

}


enum Role { EDITOR, PENCILLER_COVER, COLORIST, INKER, WRITER, PENCILLER, LETTERER, PENCILER }

final roleValues = EnumValues({
    "colorist": Role.COLORIST,
    "editor": Role.EDITOR,
    "inker": Role.INKER,
    "letterer": Role.LETTERER,
    "penciler": Role.PENCILER,
    "penciller": Role.PENCILLER,
    "penciller (cover)": Role.PENCILLER_COVER,
    "writer": Role.WRITER
});
