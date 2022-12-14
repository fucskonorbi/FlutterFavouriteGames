part of 'favourited_bloc.dart';

@immutable
abstract class FavouritedState extends Equatable {
  const FavouritedState();
}

class Loading extends FavouritedState {
  static const Loading _instance = Loading._();

  factory Loading() => _instance;

  const Loading._();

  @override
  List<Object> get props => [];
}

class Loaded extends FavouritedState {
  final List<Deal> deals;
  final bool isSortedHigh;

  const Loaded(this.deals, this.isSortedHigh);

  @override
  List<Object> get props => [deals, isSortedHigh];
}

class Error extends FavouritedState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  const Error._();

  @override
  List<Object> get props => [];
}
