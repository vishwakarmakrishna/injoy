import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PosterList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PosterList({required this.mygetapi});

  final List<MyGetApi> mygetapi;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: mygetapi.length,
      itemBuilder: (context, index) {
        return Image.network(mygetapi[index].poster);
        // return Text(mygetapi[index].imdbID);
      },
    );
  }
}

Future<List<MyGetApi>> fetchMyGetApi(http.Client client) async {
  final response = await client.get(Uri.http(
      'http://www.omdbapi.com/', '?i=tt3896198&apikey=c4033450&s=Movies/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMyGetApi, response.body);
}

// A function that converts a response body into a List<Photo>.
List<MyGetApi> parseMyGetApi(String responseBody) {
  final parsedMyGetApi = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsedMyGetApi
      .map<MyGetApi>((json) => MyGetApi.fromJson(json))
      .toList();
}

class MyGetApi {
  final String search;
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  MyGetApi({
    required this.search,
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  factory MyGetApi.fromJson(Map<String, dynamic> map) {
    return MyGetApi(
        search: map['Search'] as String,
        title: map['Title'] as String,
        year: map['Year'] as String,
        imdbID: map['imdbID'] as String,
        type: map['Type'] as String,
        poster: map['Poster'] as String);
  }

  Map<String, dynamic> toJson() => {
        'Search': search,
        'Title': title,
        'Year': year,
        'imdbID': imdbID,
        'Type': type,
        'Poster': poster,
      };
}
