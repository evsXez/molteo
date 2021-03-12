part of 'detailspage_bloc.dart';

@immutable
abstract class DetailspageState {}

class DetailspageInitial extends DetailspageState {}

///Book details are ready
class DetailspageLoadSuccess extends DetailspageState {
  final DetailedBookInfoModel bookDetails;
  DetailspageLoadSuccess(this.bookDetails);
}

///Book details fetch failed
class DetailspageLoadFailure extends DetailspageState {}
