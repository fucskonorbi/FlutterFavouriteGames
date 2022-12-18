import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as developer;

part 'network_deal.g.dart';

@JsonSerializable()
class NetworkDeal {
  @JsonKey(name: 'gameID')
  final int id;
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(name: 'salePrice')
  final double price;
  @JsonKey(name: 'isOnSale')
  final bool onSale;

  NetworkDeal({
    required this.id,
    required this.name,
    required this.price,
    required this.onSale,
  });

  static const fromJsonFactory = _$NetworkDealFromJson;

  factory NetworkDeal.fromJson(Map<String, dynamic> json) {
    developer.log('NetworkDeal.fromJson', name: 'NetworkDeal');
    return _$NetworkDealFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkDealToJson(this);
}
