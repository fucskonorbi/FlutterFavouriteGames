import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/local/deal_disk_datasource.dart';
import 'package:flutter_favourite_games_app/data/network/deal_network_datasource.dart';
import 'package:flutter_favourite_games_app/domain/deal.dart';

class DealInteractor {
  final DealNetworkDataSource _dealApiDataSource;
  final DealDiskDataSource _dealDiskDataSource;

  DealInteractor(this._dealApiDataSource, this._dealDiskDataSource);

  Future<List<Deal>?> getAllDeals() async {
    return await _dealDiskDataSource.getAllDeals();
  }

  Future<List<Deal>?> getDealByName(String name) async {
    return await _dealDiskDataSource.getDealsByName(name);
  }
}
