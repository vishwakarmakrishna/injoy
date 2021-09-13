// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List searchnesteddata;
  late List data;
  List allData = [];
  List imagesUrl = [];
  List yearsUrl = [];
  List titleUrl = [];
  List imdbIDUrl = [];
  final TextEditingController _fnameController = TextEditingController();

  @override
  void dispose() {
    _fnameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<String> fetchDataFromApi() async {
    var jsonData = await http.get(Uri.parse(
        "http://www.omdbapi.com?i=tt3896198&apikey=c4033450&s=Movies"));
    Map<String, dynamic> fetchData = await jsonDecode(jsonData.body);
    // List<dynamic> resposnedata = await fetchData['Response'];
    // List<dynamic> totalResultsdata = await fetchData['totalResults'];
    List<dynamic> searchnest = await fetchData["Search"];
    setState(() {
      // data = searchnest + resposnedata + totalResultsdata;
      // data.forEach((element) {
      //   allData.add(element);
      // });

      // searchnesteddata = searchnest;
      //  searchnest=searchnesteddata ;
      searchnest.forEach((element) {
        titleUrl.add(element["Title"]);
        imdbIDUrl.add(element["imdbIDUrl"]);
        yearsUrl.add(element["Years"]);
        imagesUrl.add(element["Poster"]);
      });
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.black,
      child: SafeArea(
        child: Column(
          children: [
            ZStack(
              [
                ZStack(
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
                                  'https://m.media-amazon.com/images/M/MV5BMTFkZmQ5OWEtNjFmMC00ZTI2LWE0ZWUtN2VhOWE1MzdiOGJhXkEyXkFqcGdeQXVyMTQ4NDY5OTc@._V1_SX300.jpg'
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
                                        // TextFormField(
                                        //   controller: _fnameController,
                                        //   textAlignVertical:
                                        //       TextAlignVertical.center,
                                        //   cursorColor: Vx.white,
                                        //   decoration: const InputDecoration(
                                        //     filled: true,
                                        //     labelText: 'Search',
                                        //   ),
                                        //   validator: (value) {},
                                        // )
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
                                    allmovielist()
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
                                allpopularlist()
                                    .box
                                    .height(context.screenHeight * 0.3)
                                    .color(Vx.black)
                                    .make(),
                              ],
                              alignment: AlignmentDirectional.topCenter,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
                    .scrollVertical()
                    .box
                    .alignTopCenter
                    .size(context.mq.size.width, context.percentHeight * 80)
                    .make()
                    .pOnly(left: context.percentWidth * 10),
              ],
            )
                .scrollVertical()
                .box
                .alignTopCenter
                .size(context.mq.size.width, context.percentHeight * 85)
                .make(),
            mybottomBar()
                .box
                .alignCenter
                .color(Vx.gray900)
                .size(context.mq.size.width, context.percentHeight * 10)
                .make(),
          ],
        ),
      ),
    );
  }

  Widget mybottomBar() {
    return ZStack(
      [
        HStack(
          [
            const Icon(
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
            const Icon(
              Icons.star,
              color: Vx.gray600,
              size: 25,
            ),
            const Icon(
              Icons.bookmark,
              color: Vx.gray600,
              size: 25,
            ),
            const Icon(
              Icons.menu,
              color: Vx.gray600,
              size: 25,
            ),
          ],
          alignment: MainAxisAlignment.spaceAround,
          axisSize: MainAxisSize.max,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ],
      alignment: AlignmentDirectional.bottomCenter,
    );
  }

  ListView allpopularlist() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagesUrl.length,

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
                    child: Image.network(
                      imagesUrl[index],
                      fit: BoxFit.cover,
                    ).card.roundedSM.make(),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  ListView allmovielist() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagesUrl.length,

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
                    child: Image.network(
                      imagesUrl[index],
                      fit: BoxFit.cover,
                    ).card.roundedSM.make(),
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
}
