import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/local/deal_dao.dart';
import 'package:flutter_favourite_games_app/data/local/floor_deal.dart';
import 'package:flutter_favourite_games_app/domain/deal.dart';
import 'package:injectable/injectable.dart';

@singleton
class DealDiskDataSource {
  final DealDao _dealDao;

  DealDiskDataSource(this._dealDao);

  Future<List<Deal>?> getAllDeals() async {
    try {
      final deals = await _dealDao.getAllDeals();
      return deals.map((deal) => deal.toDomainModel()).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    ;
  }

  Future<List<Deal>?> getDealsByName(String name) async {
    try {
      final deals = await _dealDao.getDealsByName(name);
      return deals.map((deal) => deal.toDomainModel()).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    ;
  }

  Future<void> saveDeals(List<Deal> deals) async {
    try {
      await _dealDao
          .insertDeals(deals.map((deal) => deal.toFloorModel()).toList());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

extension on FloorDeal {
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

extension on Deal {
  FloorDeal toFloorModel() {
    return FloorDeal(
      id: id,
      name: name,
      price: price,
      favorite: favorite,
      onSale: onSale,
    );
  }
}
