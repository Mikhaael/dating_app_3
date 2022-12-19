import 'package:flutter/material.dart';

import '../utils/designs/styles.dart';

primaryButton(
    {required String text,
      required VoidCallback onClick,
      required Color fillColor,
      required Color textColor,
      // double leftPadding = 0,
      // double rightPadding = 0,
      // double bottomPadding = 6,
      // double topPadding = 6,
      double borderRadius = 8,
      MainAxisAlignment viewAlignment = MainAxisAlignment.center,
      TextStyle? textStyle,
      FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      onTap: onClick,
        child: Container(
          // padding: EdgeInsets.only(
          //   // left: leftPadding,
          //   // right: rightPadding,
          //   // top: topPadding,
          //   // bottom: bottomPadding,
          // ),
          width: 154.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: viewAlignment,
            children: [
              Text(
                text,
                style: textStyle ??
                    sPrimaryTextStyle.copyWith(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: 16.0,
                    ),
              ),
            ],
          ),
        ),
    );