import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favourite_games_app/domain/deal.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/deal_interactor.dart';

part 'favourited_event.dart';
part 'favourited_state.dart';

@injectable
class FavouritedBloc extends Bloc<FavouritedEvent, FavouritedState> {
  final DealInteractor _dealInteractor;

  FavouritedBloc(this._dealInteractor) : super(Loading()) {
    on<FavouriteTapEvent>((event, emit) async {
      debugPrint("SearchedDealsAddToFavouritesEvent: ${event.deal.name}");
      if (event.deal.favorite) {
        await _dealInteractor.removeDealFromFavourites(event.deal);
      } else {
        await _dealInteractor.addDealToFavourites(event.deal);
      }
      final deals = await _dealInteractor.getFavouriteDeals();
      if (deals == null) {
        emit(Error());
        return;
      }
      emit(Loaded(deals, event.isSortedHigh));
    });
    on<LoadFavouritesEventSortedHigh>((event, emit) async {
      final deals = await _dealInteractor.getFavouriteDeals();
      if (deals == null) {
        emit(Error());
        return;
      }
      deals.sort((a, b) => b.price.compareTo(a.price));
      emit(Loaded(deals, true));
    });
    on<LoadFavouritesEventSortedLow>((event, emit) async {
      final deals = await _dealInteractor.getFavouriteDeals();
      if (deals == null) {
        emit(Error());
        return;
      }
      deals.sort((a, b) => a.price.compareTo(b.price));
      emit(Loaded(deals, false));
    });
  }
}
