import 'package:flutter/material.dart';
import 'package:injoy/mypath/mypaths.dart';
import 'package:injoy/screen/poster/fullpostermain.dart';
import 'package:injoy/widgets/bookmark/bookmarkscreen.dart';
import 'package:injoy/widgets/menu/menuscreen.dart';

import 'package:injoy/widgets/mymain.dart';
import 'package:injoy/screen/mysplscreen.dart';
import 'package:injoy/widgets/newmain.dart';
import 'package:injoy/widgets/starscreen/starscreen.dart';
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
      transitionDuration: const Duration(seconds: 1),
      buildTransition: (animation1, _, child) =>
          FadeTransition(opacity: animation1, child: child),
      routes: [
        VWidget(
          path: MyPath.splashKrPath,
          widget: const SplScreen(),
          transitionDuration: const Duration(seconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        // VGuard(
        //   beforeEnter: (vRedirector) async =>
        //       isGetData ? null : vRedirector.to('/splash'),
        //   stackedRoutes: [VWidget(path: '/home', widget: const MyHomeScreen())],
        // ),
        // VRouteRedirector(path: ':_(.+)', redirectTo: '/home'),
        VWidget(
          path: MyPath.homeKrPath,
          widget: const HomePage(),
          transitionDuration: const Duration(seconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        VWidget(
          path: MyPath.newhomeKrPath,
          widget: const NewMainHomeScreen(),
          transitionDuration: const Duration(seconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        VWidget(
          path: '/home/star',
          widget: const StarPage(),
          transitionDuration: const Duration(milliseconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        VWidget(
          path: '/home/bookmark',
          widget: const BookmarkPage(),
          transitionDuration: const Duration(milliseconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        VWidget(
          path: '/home/menu',
          widget: const MenuPage(),
          transitionDuration: const Duration(milliseconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
        VWidget(
          path: '/home/:index',
          widget: const FullPosterMain(),
          transitionDuration: const Duration(milliseconds: 1),
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
        ),
      ],
    );
  }
}
