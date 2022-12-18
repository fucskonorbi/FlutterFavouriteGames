import 'package:flutter/foundation.dart';
import 'package:flutter_favourite_games_app/data/network/network_deal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkReply {
  final List<NetworkDeal> results;

  const NetworkReply({
    required this.results,
  });

  static const fromJsonFactory = _$NetworkReplyFromJson;

  factory NetworkReply.fromJson(Map<String, dynamic> json) =>
      _$NetworkReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkReplyToJson(this);
}
