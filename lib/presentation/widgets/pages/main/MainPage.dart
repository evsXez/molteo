import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/navigation/Navigation.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/utils/Utils.dart';
import 'package:molteo/presentation/widgets/pages/details/DetailsPage.dart';
import 'package:molteo/presentation/widgets/pages/list/ListPage.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final searchController = TextEditingController();

  ListpageBloc get listpageBloc => KiwiContainer().resolve<ListpageBloc>();

  @override
  void initState() {
    searchController.addListener(() {
      final text = searchController.text;
      listpageBloc.add(SearchRequested(text));
      if (text.isEmpty) listpageBloc.add(SearchCleared());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: appBar,
          body: BlocProvider(
              create: (_) => listpageBloc,
              child: BlocListener<ListpageBloc, ListpageState>(
              listener: (context, state) { 
                if (state is ListpageShowBookDetails) openDetails(Utils.detailsFlex(context) != null, state.book); 
                if (state is ListpageClearSearch) {
                  FocusScope.of(context).unfocus();
                  setState(() { searchController.text = ""; });
                } 
              },
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
          ),
        ));
  }

  void openDetails(bool isTwoPaneMode, BookInfoModel book) {
    if (isTwoPaneMode) return;
    navigation.push(MaterialPageRoute(builder: (context) => DetailsPage(book),));
  }

  Widget get appBar => AppBar(
    title: Row(
      children: [
        Icon(Icons.search),
        SizedBox(width: 16),
        Expanded(child: TextField(controller: searchController, decoration: InputDecoration(hintText: Strings.search_hint), style: TextStyle(color: Colors.white),)),
      ],
    ),
    actions: [IconButton(icon: Icon(Icons.clear), onPressed: () { listpageBloc.add(ListpageShown()); })],
  );
}
