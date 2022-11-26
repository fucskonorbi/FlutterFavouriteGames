import 'package:dio/dio.dart';
import 'package:flutter_favourite_games_app/data/network/network_reply.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart';

part 'dio_cheapshark_service.g.dart';

@RestApi(baseUrl: 'https://www.cheapshark.com/api/1.0/')
abstract class DioCheapsharkService implements DealApiDataSource {
  factory DioCheapsharkService() {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    return _DioCheapsharkService(dio);
  }

  @override
  @GET('/deals')
  Future<HttpResponse<NetworkReply>> getAllDeals();

  @override
  @GET('/deals')
  Future<HttpResponse<NetworkReply>> getDealsByTitle(
      @Query('title') String title);
}
