part of 'detailspage_bloc.dart';

@immutable
abstract class DetailspageState {}

class DetailspageInitial extends DetailspageState {}
class DetailspageLoadSuccess extends DetailspageState {
  final DetailedBookInfoModel bookDetails;
  DetailspageLoadSuccess(this.bookDetails);
}
class DetailspageLoadFailure extends DetailspageState {}
