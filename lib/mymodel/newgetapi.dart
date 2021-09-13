import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PosterList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PosterList({required this.mygetapi});

  final List<Search> mygetapi;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: mygetapi.length,
      itemBuilder: (context, index) {
        return Text(mygetapi[index].imdbID);
        // return Image.network(mygetapi[index].imdbID);
      },
    );
  }
}

Future<List<Search>> fetchMyGetApi(http.Client client) async {
  final response = await client.get(Uri.http(
      'http://www.omdbapi.com/', '?i=tt3896198&apikey=c4033450&s=Movies/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMyGetApi, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Search> parseMyGetApi(String responseBody) {
  final parsedMyGetApi = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsedMyGetApi.map<Search>((json) => Search.fromJson(json)).toList();
}

class MoviesRespostory {
  var url = 'http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies';

  loadFromApi() async {
    var response = await http.get(Uri.parse(url));

    return json.decode(response.body);
  }
}

class MoviesController extends GetxController {
  MoviesRespostory moviesRespostory = MoviesRespostory();
  RxBool loading = false.obs;

  List movies = [].obs;

  MoviesController() {
    loadFromRespo();
  }
  loadFromRespo() async {
    loading(true);
    movies = await moviesRespostory.loadFromApi();
    loading(false);
  }
}

class MyGetApi {
  late List<Search> search;
  late String totalResults;
  late String response;

  MyGetApi(
      {required this.search,
      required this.totalResults,
      required this.response});

  MyGetApi.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <Search>[];
      json['Search'].forEach((v) {
        search.add(Search.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (search.isNotEmpty) {
      data['Search'] = search.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = totalResults;
    data['Response'] = response;
    return data;
  }
}

class Search {
  late String title;
  late String year;
  late String imdbID;
  late String type;
  late String poster;

  Search(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.poster});

  Search.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['Poster'] = poster;
    return data;
  }
}
