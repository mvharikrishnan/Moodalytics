import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodanalytics/constants/colors.dart';

class Utils {
  static SizedBox sizedBoxH20 = SizedBox(height: 20);
   static SizedBox sizedBoxH10 = SizedBox(height: 10);
  static SizedBox sizedBoxW10 = SizedBox(width: 10);
  static TextStyle emojiStyle = TextStyle(fontSize: 30);
  static Divider customDivider = Divider(
    color: Kwhite,
    thickness: 1,
  );
  static customRowDivider(double thickness, Color color) {
    return Divider(
      color: color,
      thickness: thickness,
    );
  }
}
