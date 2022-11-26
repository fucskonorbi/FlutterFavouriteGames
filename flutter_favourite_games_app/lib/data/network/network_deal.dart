import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_deal.g.dart';

@JsonSerializable()
class NetworkDeal {
  final int id;
  final String name;
  final double price;
  final bool favorite;
  final bool onSale;

  NetworkDeal({
    required this.id,
    required this.name,
    required this.price,
    required this.favorite,
    required this.onSale,
  });

  static final fromJsonFactory = _$NetworkDealFromJson;

  factory NetworkDeal.fromJson(Map<String, dynamic> json) =>
      _$NetworkDealFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkDealToJson(this);
}
