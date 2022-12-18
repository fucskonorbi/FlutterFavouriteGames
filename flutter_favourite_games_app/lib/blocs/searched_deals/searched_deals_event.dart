part of 'searched_deals_bloc.dart';

@immutable
abstract class SearchedDealsEvent extends Equatable {
  const SearchedDealsEvent();
}

class SearchedDealsSearchEvent extends SearchedDealsEvent {
  final String title;
  const SearchedDealsSearchEvent(this.title);

  @override
  List<Object> get props => [title];
}

class SearchedDealsAddToFavouritesEvent extends SearchedDealsEvent {
  final Deal deal;
  const SearchedDealsAddToFavouritesEvent(this.deal);

  @override
  List<Object> get props => [deal];
}
