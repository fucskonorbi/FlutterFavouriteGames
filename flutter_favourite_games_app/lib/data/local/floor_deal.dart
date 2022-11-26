import 'package:floor/floor.dart';

@Entity(tableName: 'deal')
class FloorDeal {
  @primaryKey
  int id;
  String name;
  double price;
  bool favorite;
  bool onSale;

  FloorDeal(
      {required this.id,
      required this.name,
      required this.price,
      required this.favorite,
      required this.onSale});
}
