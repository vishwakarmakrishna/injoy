import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injoy/mymodel/mygetapi.dart';
import 'package:http/http.dart' as http;
import 'package:injoy/mypath/mypaths.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:vrouter/vrouter.dart';

class FullPosterMain extends StatefulWidget {
  const FullPosterMain({Key? key}) : super(key: key);

  @override
  State<FullPosterMain> createState() => _FullPosterMainState();
}

bool isLoading = true;

class _FullPosterMainState extends State<FullPosterMain> {
  MyCustRestapi myCustRestapi = MyCustRestapi();

  @override
  void initState() {
    super.initState();
    newfetchDataFromApi();
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
    final index = int.parse(VRouter.of(context).pathParameters['index'] ?? '0');

    return Material(
      color: Vx.black,
      child: SafeArea(
        child: isLoading
            ? const Center(
                    child:
                        CircularProgressIndicator(color: Colors.yellowAccent))
                .box
                .height(context.screenHeight * 0.3)
                .color(Vx.black)
                .make()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => {
                                            context.vRouter
                                                .to(MyPath.homeKrPath),
                                          },
                                          child: const Icon(Icons.arrow_back,
                                              color: Vx.white, size: 20),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.share,
                                            color: Vx.white, size: 20),
                                        // 20.widthBox,
                                        Icon(Icons.info_outline,
                                            color: Vx.white, size: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              VStack(
                                [
                                  ZStack(
                                    [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              height:
                                                  context.percentHeight * 50,
                                              width: context.screenWidth,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  myCustRestapi
                                                      .search![index].poster!,
                                                  fit: BoxFit.cover,
                                                ).card.make(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                    alignment: AlignmentDirectional.topCenter,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      // height: context.percentHeight * 30,
                                      width: context.screenWidth,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            myCustRestapi.search![index].title!
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            myCustRestapi.search![index].imdbId!
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            myCustRestapi.search![index].type!
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            myCustRestapi.search![index].year!
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
