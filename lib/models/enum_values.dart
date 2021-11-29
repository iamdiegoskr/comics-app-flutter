

class EnumValues<T> {

    final Map<String, T> map;
    late final Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) => new MapEntry(v, k));
        return reverseMap;
    }
}
