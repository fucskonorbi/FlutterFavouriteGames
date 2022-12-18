// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_deal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkDeal _$NetworkDealFromJson(Map<String, dynamic> json) => NetworkDeal(
      id: int.parse(json['gameID']),
      name: json['title'] as String,
      price: double.parse(json['salePrice']),
      onSale: json['isOnSale'].toLowerCase() == '1',
    );

Map<String, dynamic> _$NetworkDealToJson(NetworkDeal instance) =>
    <String, dynamic>{
      'gameID': instance.id,
      'title': instance.name,
      'salePrice': instance.price,
      'isOnSale': instance.onSale,
    };
