import 'dart:async';
import 'package:flutter_favourite_games_app/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// final injector = GetIt.instance;

// void setupInjector() {
//   injector.registerSingleton<DealApiDataSource>(DioCheapsharkService());

//   injector
//       .registerSingleton(DealNetworkDataSource(injector<DealApiDataSource>()));

//   injector.registerSingletonAsync<DealDao>(() async {
//     final database = await $FloorFloorDealDatabase
//         .databaseBuilder('floor_database.db')
//         .build();
//     return database.dealDao;
//   });

//   injector.registerSingletonAsync(
//     () async {
//       return DealDiskDataSource(injector<DealDao>());
//     },
//     dependsOn: [DealDao],
//   );

//   injector.registerSingletonAsync(
//     () async {
//       return DealInteractor(
//         injector<DealNetworkDataSource>(),
//         injector<DealDiskDataSource>(),
//       );
//     },
//     dependsOn: [DealNetworkDataSource, DealDiskDataSource],
//   );

//   injector.registerFactory(
//     () => SearchedDealsBloc(
//       injector<DealInteractor>(),
//     ),
//   );
// }

final injector = GetIt.instance;

@InjectableInit()
Future configureDependencies() async => injector.init();
