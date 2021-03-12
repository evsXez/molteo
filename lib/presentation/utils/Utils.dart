import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {

  static const int SMALEST_TABLET_WIDTH = 600;
  static const int BIG_ENOUGH_TABLET_MAX_SIDE = 800;

  ///Just decides whether the screen is big enough, use for layout
  static bool isWide(BuildContext context) => MediaQuery.of(context).size.width >= BIG_ENOUGH_TABLET_MAX_SIDE;
  
  ///[FlexPair] of Details page in Master-Details pattern layout. Can be null which means you shouldn't use master-details pattern, just list. 
  static FlexPair detailsFlex(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < SMALEST_TABLET_WIDTH) return null;
    if (width < BIG_ENOUGH_TABLET_MAX_SIDE) return FlexPair(14, 30);
    return FlexPair(17,30);
  }

}

///Simple util wrap for launching urls
void launchURL(String url) async => await canLaunch(url) ? await launch(url) : print('Could not launch $url');

class FlexPair {
  final int value;
  final int sum;
  FlexPair(this.value, this.sum);
}