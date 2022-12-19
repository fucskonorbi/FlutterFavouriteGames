// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkReply _$NetworkReplyFromJson(Map<String, dynamic> json) => NetworkReply(
      results: (json[''] as List<dynamic>)
          .map((e) => NetworkDeal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkReplyToJson(NetworkReply instance) =>
    <String, dynamic>{
      '': instance.results,
    };
