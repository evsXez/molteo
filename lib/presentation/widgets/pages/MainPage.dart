import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molteo/businesslogic/blocs/mainpage/mainpage_bloc.dart';
import 'package:molteo/data/models/BookModel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => MainpageBloc(),
          child: listOfBooks,
        ),
      ),
    );
  }

  Widget get listOfBooks => BlocBuilder<MainpageBloc, MainpageState>(
    builder: (context, state) {
      if (state is MainpageInitial) return Center(child: CircularProgressIndicator());
      if (state is MainpageLoadSuccess) return books(state.books);
      if (state is MainpageLoadFailure) return Center(child: Text("ERROR"),);
      return Container(color: Colors.red);
    },
  );

  Widget books(List<BookModel> data) => ListView(
    children: data.map((it) => ListTile(title: Text(it.title))).toList()
  );

}