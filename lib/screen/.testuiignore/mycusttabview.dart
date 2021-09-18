// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyCusTabView {
  late IconData icons;
  late bool activeIndex;
  late Color iconsactivecolor;

  late Function onTap;

  MyCusTabView({
    required this.icons,
    required this.activeIndex,
    // required this.iconsinactivecolor,
    required this.iconsactivecolor,
    required this.onTap,
  });

  Widget mybottomBar(context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.grey[900],
      width: context.mq.size.width,
      height: context.percentHeight * 10,
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: onTap(activeIndex),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color:
                              // activeIndex
                              // ?
                              iconsactivecolor.withOpacity(0.1),
                          // : iconsinactivecolor.withOpacity(0.1),
                          spreadRadius: 2.5,
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      icons,
                      color: iconsactivecolor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        alignment: AlignmentDirectional.bottomCenter,
      ),
    );
  }
}
