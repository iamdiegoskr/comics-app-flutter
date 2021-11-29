import 'dart:convert';

import 'package:comics_skr_app/models/comic.dart';

class ComicsResponse {

    ComicsResponse({
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

    factory ComicsResponse.fromJson(String str) => ComicsResponse.fromMap(json.decode(str));

    factory ComicsResponse.fromMap(Map<String, dynamic> json) => ComicsResponse(
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
    List<Comic> results;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
    );
}
