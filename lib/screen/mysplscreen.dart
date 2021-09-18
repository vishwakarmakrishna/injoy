import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injoy/mypath/mypaths.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:vrouter/vrouter.dart';

class SplScreen extends StatefulWidget {
  const SplScreen({Key? key}) : super(key: key);

  @override
  _SplScreenState createState() => _SplScreenState();
}

class _SplScreenState extends State<SplScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        context.vRouter.to(MyPath.homeKrPath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: Vx.purple900,
            // borderRadius: BorderRadius.circular(1000),
            boxShadow: [
              BoxShadow(
                color: Vx.pink600.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.movie,
            size: context.screenWidth * 0.45,
          ),
        ),
      ),
    );
  }
}
