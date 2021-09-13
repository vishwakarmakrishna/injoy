import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injoy/mypath/mypaths.dart';

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
      const Duration(seconds: 1),
      () {
        context.vRouter.to(MyPath.homeKrPath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: Icon(
          Icons.movie,
          size: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
