// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injoy/mymodel/mygetapi.dart';
import 'package:injoy/mypath/mypaths.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:vrouter/vrouter.dart';

class StarPage extends StatefulWidget {
  const StarPage({Key? key}) : super(key: key);

  @override
  StarPageState createState() => StarPageState();
}

bool isLoading = true;

class StarPageState extends State<StarPage> {
  MyCustRestapi myCustRestapi = MyCustRestapi();

  @override
  void initState() {
    super.initState();

    _populateAllMovies();
  }

  void _populateAllMovies() async {
    var newmyCustRestapi = await newfetchDataFromApi();
    setState(() {
      newmyCustRestapi = newmyCustRestapi;
    });
  }

  newfetchDataFromApi() async {
    var newurl = Uri.parse(
        "https://www.omdbapi.com?i=tt3896198&apikey=c4033450&s=Movies");

    var newjsonData = await http.get(newurl);

    setState(() {
      myCustRestapi = MyCustRestapi.fromJson(json.decode(newjsonData.body));

      isLoading = false;
    });
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
                VStack(
                  [
                    'Star'.text.white.extraBold.make(),
                  ],
                ).scrollVertical(),
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
                ),
              ),
              GestureDetector(
                onTap: () => {
                  context.vRouter.to('/home/star'),
                },
                child: const Icon(
                  Icons.star,
                  color: Vx.gray600,
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
}
