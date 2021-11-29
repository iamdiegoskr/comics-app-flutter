import 'dart:convert';

import 'package:comics_skr_app/models/enum_values.dart';

class Date {
    Date({
        this.type,
        required this.date,
    });

    DateType? type;
    String date;

    factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

    factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]],
        date: json["date"],
    );
}


enum DateType { ONSALE_DATE, FOC_DATE }

final dateTypeValues = EnumValues({
    "focDate": DateType.FOC_DATE,
    "onsaleDate": DateType.ONSALE_DATE
});