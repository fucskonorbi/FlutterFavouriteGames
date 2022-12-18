import 'package:flutter_favourite_games_app/data/local/floor_deal.dart';
import 'package:injectable/injectable.dart';

abstract class DealDao {
  Future<List<FloorDeal>> getAllDeals();
  Future<List<FloorDeal>> getDealsByName(String name);
  Future<void> insertDeals(List<FloorDeal> deals);
  Future<void> updateDeal(FloorDeal deal);
  Future<void> deleteDeal(FloorDeal deal);
}
