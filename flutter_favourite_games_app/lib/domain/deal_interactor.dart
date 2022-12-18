import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/local/deal_disk_datasource.dart';
import 'package:flutter_favourite_games_app/data/network/deal_network_datasource.dart';
import 'package:flutter_favourite_games_app/domain/deal.dart';
import 'package:injectable/injectable.dart';

@singleton
class DealInteractor {
  final DealNetworkDataSource _dealApiDataSource;
  final DealDiskDataSource _dealDiskDataSource;

  DealInteractor(this._dealApiDataSource, this._dealDiskDataSource);

  Future<List<Deal>?> getAllDeals() async {
    final networkDeals = await _dealApiDataSource.getAllDeals();
    if (networkDeals == null) return null;
    await _dealDiskDataSource.saveDeals(networkDeals);
    return networkDeals;
  }

  Future<List<Deal>?> getDealByName(String name) async {
    final networkDeals = await _dealApiDataSource.getDealsByName(name);
    if (networkDeals == null) return null;
    return networkDeals;
  }

  Future<void> addDealToFavourites(Deal deal) async {
    Deal updatedDeal = deal.copyWith(favorite: true);
    _dealDiskDataSource.updateDeal(updatedDeal);
  }
}
