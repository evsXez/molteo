import 'package:flutter/material.dart';

class Utils {

  static int detailsFlex(BuildContext context) {
    // if (true) return null; //debug

    final width = MediaQuery.of(context).size.width;
    if (width < 600) return null;
    if (width < 800) return 1;
    return 2;
  }

}