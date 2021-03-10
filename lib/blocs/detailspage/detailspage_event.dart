part of 'detailspage_bloc.dart';

@immutable
abstract class DetailspageEvent {}

class DetailspageShown extends DetailspageEvent {
  final BookInfoModel book;
  DetailspageShown(this.book);
}