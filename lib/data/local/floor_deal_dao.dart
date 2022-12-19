import 'package:floor/floor.dart';
import 'package:flutter_favourite_games_app/data/local/floor_deal.dart';
import 'package:flutter_favourite_games_app/data/local/deal_dao.dart';
import 'package:injectable/injectable.dart';

@dao
abstract class FloorDealDao implements DealDao {
  @override
  @Query('SELECT * FROM new_deals')
  Future<List<FloorDeal>> getAllDeals();

  @override
  @Query('SELECT * FROM new_deals WHERE name = :name')
  Future<List<FloorDeal>> getDealsByName(String name);

  @override
  @insert
  Future<void> insertDeals(List<FloorDeal> deals);

  @override
  @update
  Future<void> updateDeal(FloorDeal deal);

  @override
  @delete
  Future<void> deleteDeal(FloorDeal deal);
}
