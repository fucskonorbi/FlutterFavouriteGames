import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/network/network_deal.dart';
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart';
import 'package:flutter_favourite_games_app/domain/deal.dart';
import 'package:injectable/injectable.dart';

@singleton
class DealNetworkDataSource {
  final DealApiDataSource _dealApiDataSource;

  DealNetworkDataSource(this._dealApiDataSource);

  Future<List<Deal>?> getAllDeals() async {
    final networkResponse = await _dealApiDataSource.getAllDeals();
    if (networkResponse.response.statusCode == 200) return null;
    final networkDeals = networkResponse.response.data;
    return networkDeals
        ?.map((networkDeal) => networkDeal.toDomainModel())
        .toList();
  }

  Future<List<Deal>?> getDealsByName(String title) async {
    final networkResponse = await _dealApiDataSource.getDealsByTitle(title);
    if (networkResponse.response.statusCode != 200) return null;
    final networkDeals = networkResponse.data.results;
    if (kDebugMode) {
      print(networkDeals);
    }
    return networkDeals
        .map((networkDeal) => networkDeal.toDomainModel())
        .toList();
  }
}

extension on NetworkDeal {
  Deal toDomainModel() {
    return Deal(
      id: id,
      name: name,
      price: price,
      favorite: favorite,
      onSale: onSale,
    );
  }
}
