// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_favourite_games_app/blocs/searched_deals/searched_deals_bloc.dart'
    as _i10;
import 'package:flutter_favourite_games_app/data/local/deal_disk_datasource.dart'
    as _i7;
import 'package:flutter_favourite_games_app/data/local/floor_database.dart'
    as _i4;
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart'
    as _i5;
import 'package:flutter_favourite_games_app/data/network/deal_network_datasource.dart'
    as _i8;
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart'
    as _i6;
import 'package:flutter_favourite_games_app/di/network_module.dart' as _i11;
import 'package:flutter_favourite_games_app/domain/deal_interactor.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.Dio>(networkModule.dio);
    await gh.singletonAsync<_i4.FloorDealDatabase>(
      () => _i4.FloorDealDatabase.createDatabase(),
      preResolve: true,
    );
    gh.singleton<_i5.DealApiDataSource>(
        _i6.DioCheapsharkService(gh<_i3.Dio>()));
    gh.singleton<_i7.DealDiskDataSource>(
        _i7.DealDiskDataSource(gh<_i4.FloorDealDatabase>()));
    gh.singleton<_i8.DealNetworkDataSource>(
        _i8.DealNetworkDataSource(gh<_i5.DealApiDataSource>()));
    gh.singleton<_i9.DealInteractor>(_i9.DealInteractor(
      gh<_i8.DealNetworkDataSource>(),
      gh<_i7.DealDiskDataSource>(),
    ));
    gh.factory<_i10.SearchedDealsBloc>(
        () => _i10.SearchedDealsBloc(gh<_i9.DealInteractor>()));
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}
