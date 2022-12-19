part of 'searched_deals_bloc.dart';

@immutable
abstract class SearchedDealsState extends Equatable {
  const SearchedDealsState();
}

class SearchedDealsLoading extends SearchedDealsState {
  static const SearchedDealsLoading _instance = SearchedDealsLoading._();

  factory SearchedDealsLoading() => _instance;

  const SearchedDealsLoading._();

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
  static final SearchedDealsError _instance = SearchedDealsError._();

  factory SearchedDealsError() => _instance;

  const SearchedDealsError._();

  @override
  List<Object> get props => [];
}
