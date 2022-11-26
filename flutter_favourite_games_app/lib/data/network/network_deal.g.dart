// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_deal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkDeal _$NetworkDealFromJson(Map<String, dynamic> json) => NetworkDeal(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      favorite: json['favorite'] as bool,
      onSale: json['onSale'] as bool,
    );

Map<String, dynamic> _$NetworkDealToJson(NetworkDeal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'favorite': instance.favorite,
      'onSale': instance.onSale,
    };
