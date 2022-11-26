import 'package:flutter_favourite_games_app/data/local/deal_disk_datasource.dart';
import 'package:flutter_favourite_games_app/data/network/deal_network_datasource.dart';
import 'package:flutter_favourite_games_app/domain/deal_interactor.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_favourite_games_app/data/local/deal_dao.dart';
import 'package:flutter_favourite_games_app/data/local/floor_database.dart';
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart';
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart';

final injector = GetIt.instance;

void setupInjector() {
  injector.registerSingleton<DealApiDataSource>(DioCheapsharkService());

  injector
      .registerSingleton(DealNetworkDataSource(injector<DealApiDataSource>()));

  injector.registerSingletonAsync<DealDao>(() async {
    final database = await $FloorFloorDealDatabase
        .databaseBuilder('floor_database.db')
        .build();
    return database.dealDao;
  });

  injector.registerSingletonAsync(
    () async {
      return DealDiskDataSource(injector<DealDao>());
    },
    dependsOn: [DealDao],
  );

  injector.registerSingletonAsync(
    () async {
      return DealInteractor(
        injector<DealNetworkDataSource>(),
        injector<DealDiskDataSource>(),
      );
    },
    dependsOn: [DealNetworkDataSource, DealDiskDataSource],
  );
}
