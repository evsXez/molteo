part of 'detailspage_bloc.dart';

@immutable
abstract class DetailspageEvent {}

///User somehow opened book details
class DetailspageShown extends DetailspageEvent {
  final BookInfoModel book;
  DetailspageShown(this.book);
}

///Loading of details failed, then retry button pressed
class DetailspageRetryPressed extends DetailspageEvent {}
