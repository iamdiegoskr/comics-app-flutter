import 'dart:convert';

import 'package:comics_skr_app/models/enum_values.dart';

class Price {
    Price({
        this.type,
        required this.price,
    });

    PriceType? type;
    double price;

    factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "type": priceTypeValues.reverse[type],
        "price": price,
    };
}

enum PriceType { PRINT_PRICE }

final priceTypeValues = EnumValues({
    "printPrice": PriceType.PRINT_PRICE
});