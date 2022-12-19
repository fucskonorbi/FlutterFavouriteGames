import 'dart:async';

import 'package:flutter_favourite_games_app/data/network/network_reply.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import 'network_deal.dart';

abstract class DealApiDataSource {
  Future<HttpResponse<List<NetworkDeal>>> getAllDeals();
  Future<HttpResponse<List<NetworkDeal>>> getDealsByTitle(String title);
}
