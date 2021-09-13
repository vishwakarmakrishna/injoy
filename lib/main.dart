import 'package:flutter/material.dart';
import 'package:injoy/mypath/mypaths.dart';

import 'package:injoy/screen/mymain.dart';
import 'package:injoy/screen/mysplscreen.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isGetData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'OrderAdd',
      themeMode: ThemeMode.system,
      mode: VRouterMode.history,
      debugShowCheckedModeBanner: false,
      initialUrl: MyPath.splashKrPath,
      routes: [
        VWidget(
          path: MyPath.splashKrPath,
          widget: const SplScreen(),
        ),
        // VGuard(
        //   beforeEnter: (vRedirector) async =>
        //       isGetData ? null : vRedirector.to('/splash'),
        //   stackedRoutes: [VWidget(path: '/home', widget: const MyHomeScreen())],
        // ),
        // VRouteRedirector(path: ':_(.+)', redirectTo: '/home'),
        VWidget(
          path: MyPath.homeKrPath,
          aliases: const ['/Home', '/HOME', '/Main', '/MAIN'],
          widget: const HomePage(),
        ),
      ],
    );
  }
}
