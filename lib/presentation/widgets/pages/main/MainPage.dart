import 'package:flutter/material.dart';
import 'package:molteo/presentation/navigation/Navigation.dart';
import 'package:molteo/presentation/utils/Utils.dart';
import 'package:molteo/presentation/widgets/pages/details/DetailsPage.dart';
import 'package:molteo/presentation/widgets/pages/list/ListPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: LayoutBuilder(
        builder: (context, constraints) {
          final flex = Utils.detailsFlex(context);
          return flex == null 
            ? ListPage()
            : Row(children: [
                Expanded(flex: 1, child: ListPage()), 
                Expanded(flex: flex, child: DetailsPage(null)),
              ]);
        }
      )
    );
  }
}