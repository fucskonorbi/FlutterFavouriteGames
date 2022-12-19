part of 'favourited_bloc.dart';

@immutable
abstract class FavouritedEvent extends Equatable {
  const FavouritedEvent();
}

class FavouriteTapEvent extends FavouritedEvent {
  final Deal deal;
  const FavouriteTapEvent(this.deal);

  @override
  List<Object> get props => [deal];
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
