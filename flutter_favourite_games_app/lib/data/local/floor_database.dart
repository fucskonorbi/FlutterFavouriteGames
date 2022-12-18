import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_favourite_games_app/data/local/floor_deal.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_favourite_games_app/data/local/floor_deal_dao.dart';

part 'floor_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [FloorDeal])
@singleton
abstract class FloorDealDatabase extends FloorDatabase {
  FloorDealDao get dealDao;

  @factoryMethod
  @preResolve
  static Future<FloorDealDatabase> createDatabase() async {
    final database =
        await $FloorFloorDealDatabase.databaseBuilder('deals.db').build();
    return database;
  }
}
