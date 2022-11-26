import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Deal extends Equatable {
  final int id;
  final String name;
  final double price;
  final bool favorite;
  final bool onSale;

  const Deal({
    required this.id,
    required this.name,
    required this.price,
    required this.favorite,
    required this.onSale,
  });

  Deal copyWith({
    int? id,
    String? name,
    double? price,
    bool? favorite,
    bool? onSale,
  }) {
    return Deal(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      favorite: favorite ?? this.favorite,
      onSale: onSale ?? this.onSale,
    );
  }

  @override
  List<Object?> get props => [id, name, price, favorite, onSale];
}
