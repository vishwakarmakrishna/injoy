// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:injoy/mymodel/mygetapi.dart';
// import 'package:injoy/mypath/mypaths.dart';

// import 'package:vrouter/vrouter.dart';
// import 'package:http/http.dart' as http;
import 'package:injoy/screen/testuiignore/newgetapi.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final MoviesController moviesController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Obx(() {
              if (moviesController.loading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (moviesController.movies.isEmpty) {
                return const Center(
                  child: Text('No Data Found'),
                );
              } else {
                return _buildMovieList();
              }
            }))
          ],
        ),
      ),
    );
  }

  ListView _buildMovieList() {
    return ListView.builder(
        itemCount: moviesController.movies.length,
        itemBuilder: (context, index) => Card(
              elevation: 10.0,
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(9),
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Row(children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          moviesController.movies[index]['Search']),
                      fit: BoxFit.cover,
                    )),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ]),
              ),
            ));
  }
}
