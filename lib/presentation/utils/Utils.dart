import 'package:flutter/material.dart';

class Utils {

  static bool isWideLayout(BuildContext context) => MediaQuery.of(context).size.width >= 600;

  static int detailsFlex(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return null;
    if (width < 800) return 1;
    return 2;
  }

}