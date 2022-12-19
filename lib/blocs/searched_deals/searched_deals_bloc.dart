import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart';
import 'package:flutter_favourite_games_app/domain/deal_interactor.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/network/network_deal.dart';
import '../../domain/deal.dart';

part 'searched_deals_event.dart';
part 'searched_deals_state.dart';

@injectable
class SearchedDealsBloc extends Bloc<SearchedDealsEvent, SearchedDealsState> {
  final DealInteractor _dealInteractor;

  SearchedDealsBloc(this._dealInteractor) : super(SearchedDealsLoading()) {
    on<SearchedDealsSearchEvent>((event, emit) async {
      final deals = await _dealInteractor.getDealByName(event.title);
      if (deals == null) {
        emit(SearchedDealsError());
        return;
      }
      final favorited_deals = await _dealInteractor.getFavouriteDeals();
      debugPrint("favorited_deals: ${favorited_deals}");
      final deals_updated = deals.map((deal) {
        if (favorited_deals != null) {
          for (Deal favorited_deal in favorited_deals) {
            if (favorited_deal.id == deal.id) {
              return deal.copyWith(favorite: true);
            }
          }
        }
        return deal;
      }).toList();
      emit(SearchedDealsLoaded(deals_updated));
    });
    on<SearchedDealsFavouriteTapEvent>((event, emit) async {
      debugPrint("SearchedDealsAddToFavouritesEvent: ${event.deal.name}");
      if (event.deal.favorite) {
        await _dealInteractor.removeDealFromFavourites(event.deal);
      } else {
        await _dealInteractor.addDealToFavourites(event.deal);
      }
    });
  }
}
