import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/navigation/Navigation.dart';
import 'package:molteo/presentation/utils/Utils.dart';
import 'package:molteo/presentation/widgets/pages/details/DetailsPage.dart';
import 'package:molteo/presentation/widgets/pages/list/ListPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        home: BlocProvider(
            create: (_) => ListpageBloc(),
            child: BlocListener<ListpageBloc, ListpageState>(
            listener: (context, state) { if (state is ListpageShowBookDetails) openDetails(Utils.detailsFlex(context) != null, state.book); },
            child: BlocBuilder<ListpageBloc, ListpageState>(
              buildWhen: (prev, current) => current is ListpageShowBookDetails,
              builder: (context, state) {
                final BookInfoModel book = state is ListpageShowBookDetails ? state.book : null;
                final flex = Utils.detailsFlex(context);
                return flex == null
                    ? ListPage()
                    : Row(children: [
                        Expanded(flex: 1, child: ListPage()),
                        Expanded(flex: flex, child: DetailsPage(book)),
                      ]);
              }
            ),
          ),
        ));
  }

  void openDetails(bool isTwoPaneMode, BookInfoModel book) {
    if (isTwoPaneMode) return;
    navigation.push(MaterialPageRoute(builder: (context) => DetailsPage(book),));
  }

}
