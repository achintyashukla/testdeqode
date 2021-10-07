import 'dart:convert';

class DataModel {
  DataModel({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  List<Search> search;
  String totalResults;
  String response;

  factory DataModel.fromRawJson(String str) => DataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Search": List<dynamic>.from(search.map((x) => x.toJson())),
    "totalResults": totalResults,
    "Response": response,
  };
}

class Search {
  Search({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  String title;
  String year;
  String imdbId;
  Type? type;
  String poster;

  factory Search.fromRawJson(String str) => Search.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: typeValues.map[json["Type"]],
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": typeValues.reverse[type],
    "Poster": poster,
  };
}

// ignore: constant_identifier_names
enum Type { MOVIE, SERIES }

final typeValues = EnumValues({
  "movie": Type.MOVIE,
  "series": Type.SERIES
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap;
  }
}
