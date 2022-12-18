import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<SearchedDealsSearch>((event, emit) async {
      final deals = await _dealInteractor.getDealByName(event.title);
      emit(SearchedDealsLoaded(deals!));
    });
  }
}
