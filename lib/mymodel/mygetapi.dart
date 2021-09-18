// To parse this JSON data, do
//
//     final myCustRestapi = myCustRestapiFromJson(jsonString);

import 'dart:convert';

MyCustRestapi myCustRestapiFromJson(String str) =>
    MyCustRestapi.fromJson(json.decode(str));

String myCustRestapiToJson(MyCustRestapi data) => json.encode(data.toJson());

class MyCustRestapi {
  MyCustRestapi({
    this.search,
    this.totalResults,
    this.response,
  });

  List<Search>? search;
  String? totalResults;
  String? response;

  factory MyCustRestapi.fromJson(Map<String, dynamic> json) => MyCustRestapi(
        search:
            List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search!.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String? title;
  String? year;
  String? imdbId;
  Type? type;
  String? poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map![json["Type"]],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse![type],
        "Poster": poster,
      };
}

enum Type { MOVIE, SERIES }

final typeValues = EnumValues({"movie": Type.MOVIE, "series": Type.SERIES});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
