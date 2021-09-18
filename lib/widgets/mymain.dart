// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injoy/mymodel/mygetapi.dart';
import 'package:injoy/mypath/mypaths.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

bool isLoading = true;

class HomePageState extends State<HomePage> {
  // late List searchnesteddata;
  // late List typenestdata;
  // late List data;
  // List allData = [];
  // List imagesUrl = [];
  // List yearsUrl = [];
  // List titleUrl = [];
  // List typeUrl = [];
  // List imdbIDUrl = [];
  // final TextEditingController _fnameController = TextEditingController();

  // @override
  // void dispose() {
  //    _fnameController.dispose();
  //   super.dispose();
  // }

  MyCustRestapi myCustRestapi = MyCustRestapi();
  // List<MyCustRestapi> newmyCustRestapi = <MyCustRestapi>[];

  @override
  void initState() {
    super.initState();
    //  newfetchDataFromApi();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    var newmyCustRestapi = await newfetchDataFromApi();
    setState(() {
      newmyCustRestapi = newmyCustRestapi;
    });
  }

  // Future<List<MyCustRestapi>>
  newfetchDataFromApi() async {
    var newurl = Uri.parse(
        "https://www.omdbapi.com?i=tt3896198&apikey=c4033450&s=Movies");

    var newjsonData = await http.get(newurl);
    // if (newjsonData.statusCode == 200) {
    setState(() {
      myCustRestapi = MyCustRestapi.fromJson(json.decode(newjsonData.body));

      isLoading = false;
    });
    //   Iterable list =
    //       MyCustRestapi.fromJson(json.decode(newjsonData.body)) as List;
    //   return list
    //       .map((newmyCustRestapi) => MyCustRestapi.fromJson(newmyCustRestapi))
    //       .toList();
    // } else {
    //   throw Exception('Not Able to load');
    // }
  }

  // Future<String> fetchDataFromApi() async {
  //   var jsonData = await http.get(Uri.parse(
  //       "https://www.omdbapi.com?i=tt3896198&apikey=c4033450&s=Movies"));
  //   Map<String, dynamic> fetchData = await jsonDecode(jsonData.body);

  //   List<dynamic> searchnest = await fetchData["Search"];

  //   setState(() {
  //     print(typeUrl);
  //     searchnest.forEach((element) {
  //       titleUrl.add(element["Title"]);
  //       typeUrl.add(element["Type"]);
  //       imdbIDUrl.add(element["imdbIDUrl"]);
  //       yearsUrl.add(element["Years"]);
  //       imagesUrl.add(element["Poster"]);
  //     });
  //   });

  //   return "Success";
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.black,
      child: SafeArea(
        child: Column(
          children: [
            ZStack(
              [
                VStack(
                  [
                    VStack(
                      [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.yellowAccent),
                                        )
                                      : 'https://m.media-amazon.com/images/M/MV5BMTFkZmQ5OWEtNjFmMC00ZTI2LWE0ZWUtN2VhOWE1MzdiOGJhXkEyXkFqcGdeQXVyMTQ4NDY5OTc@._V1_SX300.jpg'
                                          .circularNetworkImage(radius: 20.0),
                                  10.widthBox,
                                  'Chelsie Brett'.text.bold.white.make(),
                                ],
                              ),
                              Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5),
                                      height: 40,
                                      child: Row(children: const [
                                        Icon(Icons.search_rounded,
                                            color: Vx.gray600, size: 20),
                                        Text(
                                          'Search',
                                          style: TextStyle(color: Vx.gray600),
                                        ),
                                      ]))
                                  .box
                                  .leftRounded(value: 5.0)
                                  .gray800
                                  .make(),
                            ]).box.py12.make(),
                        VStack(
                          [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(5),
                                                height: 30,
                                                child: Row(children: [
                                                  10.widthBox,
                                                  'Movies'
                                                      .text
                                                      .gray600
                                                      .bold
                                                      .make(),
                                                  10.widthBox,
                                                ]))
                                            .box
                                            .withRounded(value: 4.0)
                                            .gray800
                                            .make(),
                                      ]).box.py12.make(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Vx.pink600,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Vx.pink600
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 15,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Row(children: [
                                              10.widthBox,
                                              'Shows'.text.white.bold.make(),
                                              10.widthBox,
                                            ])).box.rounded.make(),
                                      ]).box.py12.make(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(5),
                                                height: 30,
                                                child: Row(children: [
                                                  10.widthBox,
                                                  'Music'
                                                      .text
                                                      .gray600
                                                      .extraBold
                                                      .make(),
                                                  10.widthBox,
                                                ]))
                                            .box
                                            .withRounded(value: 4.0)
                                            .gray800
                                            .make(),
                                      ]).box.py12.make(),
                                  15.widthBox,
                                ]).box.py8.make(),
                            VStack(
                              [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      10.widthBox,
                                      'New'
                                          .text
                                          .extraBold
                                          .uppercase
                                          .size(20)
                                          .white
                                          .make(),
                                    ]).box.py8.make(),
                                ZStack(
                                  [
                                    samplelist()
                                        .box
                                        .height(context.screenHeight * 0.3)
                                        .color(Vx.black)
                                        .make(),
                                  ],
                                  alignment: AlignmentDirectional.bottomCenter,
                                ),
                              ],
                            ),
                            30.heightBox,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  10.widthBox,
                                  'Popular'
                                      .text
                                      .extraBold
                                      .uppercase
                                      .size(20)
                                      .white
                                      .make(),
                                ]).box.py8.make(),
                            ZStack(
                              [
                                isLoading
                                    ? const Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.yellowAccent))
                                        .box
                                        .height(context.screenHeight * 0.3)
                                        .color(Vx.black)
                                        .make()
                                    : allpopularlist()
                                        .box
                                        .height(context.screenHeight * 0.3)
                                        .color(Vx.black)
                                        .make(),
                              ],
                              alignment: AlignmentDirectional.topCenter,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).scrollVertical().pOnly(left: context.percentWidth * 10),
              ],
            )
                .box
                .alignTopCenter
                .size(context.mq.size.width, context.safePercentHeight * 90)
                .make(),
            mybottomBar()
                .box
                .alignBottomCenter
                .color(Vx.gray900)
                .size(context.mq.size.width, context.safePercentHeight * 10)
                .make(),
          ],
        ),
      ),
    );
  }

  Widget mybottomBar() {
    return ZStack(
      [
        Center(
          child: HStack(
            [
              GestureDetector(
                onTap: () => {
                  context.vRouter.to('/home'),
                },
                child: const Icon(
                  Icons.home_filled,
                  color: Vx.pink600,
                  size: 25,
                )
                    .box
                    .withDecoration(
                      BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Vx.pink600.withOpacity(0.1),
                            spreadRadius: 2.5,
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                    )
                    .make(),
              ),
              GestureDetector(
                onTap: () => {
                  context.vRouter.to('/home/star'),
                },
                child: const Icon(
                  Icons.star,
                  color: Vx.gray600,
                  size: 25,
                ),
              ),
              GestureDetector(
                onTap: () => {
                  context.vRouter.to('/home/bookmark'),
                },
                child: const Icon(
                  Icons.bookmark,
                  color: Vx.gray600,
                  size: 25,
                ),
              ),
              GestureDetector(
                onTap: () => {
                  context.vRouter.to('/home/menu'),
                },
                child: const Icon(
                  Icons.menu,
                  color: Vx.gray600,
                  size: 25,
                ),
              ),
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ],
      alignment: AlignmentDirectional.bottomCenter,
    );
  }

  Widget samplelist() {
    return isLoading
        ? const Center(
                child: CircularProgressIndicator(color: Colors.yellowAccent))
            .box
            .height(context.screenHeight * 0.3)
            .color(Vx.black)
            .make()
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myCustRestapi.search!.length,

            // padding: const EdgeInsets.only(right: 100.0),
            itemBuilder: (BuildContext context, int index) {
              return ZStack(
                [
                  HStack(
                    [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: context.screenHeight * 0.3,
                          width: context.screenWidth * 0.4,
                          child: GestureDetector(
                            onTap: () => {context.vRouter.to('/home/$index')},
                            child: Image.network(
                              myCustRestapi.search![index].poster!,
                              fit: BoxFit.cover,
                            ).card.roundedSM.make(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      height: 30,
                      child: Row(children: [
                        'New'.text.uppercase.white.extraBold.make(),
                      ])).box.withRounded(value: 4.0).green500.make(),
                ],
                alignment: AlignmentDirectional.bottomCenter,
              );
            },
          );
  }

  Widget allpopularlist() {
    return isLoading
        ? const Center(
                child: CircularProgressIndicator(color: Colors.yellowAccent))
            .box
            .height(context.screenHeight * 0.3)
            .color(Vx.black)
            .make()
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myCustRestapi.search!.length,

            // padding: const EdgeInsets.only(right: 100.0),
            itemBuilder: (BuildContext context, int index) {
              return ZStack(
                [
                  HStack(
                    [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () => {
                            // getData(index),

                            context.vRouter.to('/home/$index')
                          },
                          child: Image.network(
                            myCustRestapi.search![index].poster!,
                            fit: BoxFit.cover,
                          ).card.roundedSM.make(),
                        ),
                      )
                          .box
                          .size(
                            context.screenWidth * 0.4,
                            context.screenHeight * 0.3,
                          )
                          .make()
                    ],
                  ),
                ],
              );
            },
          );
  }
}
