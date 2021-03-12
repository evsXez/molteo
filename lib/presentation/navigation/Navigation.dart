import 'package:flutter/material.dart';

///Simplifies navigation on early stage
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigation => navigatorKey.currentState;