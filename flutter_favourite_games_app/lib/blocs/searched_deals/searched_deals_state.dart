part of 'searched_deals_bloc.dart';

@immutable
abstract class SearchedDealsState extends Equatable {
  const SearchedDealsState();
}

class SearchedDealsInitial extends SearchedDealsState {
  @override
  List<Object> get props => [];
}

class SearchedDealsLoading extends SearchedDealsState {
  @override
  List<Object> get props => [];
}

class SearchedDealsLoaded extends SearchedDealsState {
  final List<Deal> deals;

  const SearchedDealsLoaded(this.deals);

  @override
  List<Object> get props => [deals];
}

class SearchedDealsError extends SearchedDealsState {
  @override
  List<Object> get props => [];
}
