part of 'favourited_bloc.dart';

@immutable
abstract class FavouritedEvent extends Equatable {
  const FavouritedEvent();
}

class FavouriteTapEvent extends FavouritedEvent {
  final Deal deal;
  final bool isSortedHigh;
  const FavouriteTapEvent(this.deal, this.isSortedHigh);

  @override
  List<Object> get props => [deal, isSortedHigh];
}

class LoadFavouritesEventSortedHigh extends FavouritedEvent {
  const LoadFavouritesEventSortedHigh();

  @override
  List<Object> get props => [];
}

class LoadFavouritesEventSortedLow extends FavouritedEvent {
  const LoadFavouritesEventSortedLow();

  @override
  List<Object> get props => [];
}
