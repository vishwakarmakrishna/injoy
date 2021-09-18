import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injoy/mymodel/mygetapi.dart';
import 'package:velocity_x/velocity_x.dart';

class NewMainHomeScreen extends StatefulWidget {
  const NewMainHomeScreen({Key? key}) : super(key: key);

  @override
  _NewMainHomeScreenState createState() => _NewMainHomeScreenState();
}

class _NewMainHomeScreenState extends State<NewMainHomeScreen> {
  MyCustRestapi myCustRestapi = MyCustRestapi();

  // List newsearch = [];
  bool isLoading = true;

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
      // newsearch = Search() as List<Search>;
      // newsearch = myCustRestapi.search! as List<Search>;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.yellowAccent))
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.widthBox,
                        const Text(
                          'New',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      color: Vx.black,
                      height: context.screenHeight * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: myCustRestapi.search!.length,
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
                                        myCustRestapi.search![index].poster!,
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
                                        'New'
                                            .text
                                            .uppercase
                                            .white
                                            .extraBold
                                            .make(),
                                      ]))
                                  .box
                                  .withRounded(value: 4.0)
                                  .green500
                                  .make(),
                            ],
                            alignment: AlignmentDirectional.bottomCenter,
                          );
                        },
                      ),
                    ),
                    Container(
                      color: Vx.black,
                      height: context.screenHeight * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: myCustRestapi.search!.length,
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
                                        myCustRestapi.search![index].poster!,
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
                                        'New'
                                            .text
                                            .uppercase
                                            .white
                                            .extraBold
                                            .make(),
                                      ]))
                                  .box
                                  .withRounded(value: 4.0)
                                  .green500
                                  .make(),
                            ],
                            alignment: AlignmentDirectional.bottomCenter,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
