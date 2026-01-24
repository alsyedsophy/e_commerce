import 'package:hive/hive.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final double price;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  final String size;
  @HiveField(6)
  final String color;
  @HiveField(7)
  final int stock;

  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
    required this.stock,
  });

  CartItemModel copyWith({int? quantity, String? size, String? color}) {
    return CartItemModel(
      id: id,
      name: name,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      color: color ?? this.color,
      stock: stock,
    );
  }
}
