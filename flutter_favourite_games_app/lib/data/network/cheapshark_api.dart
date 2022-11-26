import 'dart:async';

import 'package:flutter_favourite_games_app/data/network/network_reply.dart';
import 'package:retrofit/retrofit.dart';

abstract class DealApiDataSource {
  Future<HttpResponse<NetworkReply>> getAllDeals();
  Future<HttpResponse<NetworkReply>> getDealsByTitle(String title);
}
