part of 'searched_deals_bloc.dart';

@immutable
abstract class SearchedDealsEvent extends Equatable {
  const SearchedDealsEvent();
}

class SearchedDealsSearch extends SearchedDealsEvent {
  final String title;

  const SearchedDealsSearch(this.title);

  @override
  List<Object> get props => [title];
}
