import 'package:dio/dio.dart';
import 'package:flutter_favourite_games_app/data/network/network_deal.dart';
import 'package:flutter_favourite_games_app/data/network/network_reply.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart';

part 'dio_cheapshark_service.g.dart';

@RestApi(baseUrl: 'https://www.cheapshark.com/api/1.0/')
@Singleton(as: DealApiDataSource)
abstract class DioCheapsharkService implements DealApiDataSource {
  @factoryMethod
  factory DioCheapsharkService(Dio dio) = _DioCheapsharkService;

  @override
  @GET('/deals')
  Future<HttpResponse<List<NetworkDeal>>> getAllDeals();

  @override
  @GET('/deals')
  Future<HttpResponse<List<NetworkDeal>>> getDealsByTitle(
      @Query('title') String title);
}
