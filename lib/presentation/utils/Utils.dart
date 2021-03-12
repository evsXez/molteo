import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {

  

  static bool isWide(BuildContext context) => MediaQuery.of(context).size.width >= 800;
  
  static FlexPair detailsFlex(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return null;
    if (width < 800) return FlexPair(14, 30);
    return FlexPair(17,30);
  }

}

void launchURL(String url) async => await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';


class FlexPair {
  final int value;
  final int sum;
  FlexPair(this.value, this.sum);
}