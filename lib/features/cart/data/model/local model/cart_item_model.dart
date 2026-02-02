import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:hive/hive.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class HiveCartItemModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String productId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final double price;
  @HiveField(5)
  int quantity;
  @HiveField(6)
  final String size;
  @HiveField(7)
  final String color;
  @HiveField(8)
  final bool inStock;
  @HiveField(9)
  final DateTime createdAt;
  @HiveField(10)
  final DateTime updatedAt;

  HiveCartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
    this.inStock = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HiveCartItemModel.fromEntity(CartItem entity) {
    return HiveCartItemModel(
      id: entity.id,
      productId: entity.productId,
      name: entity.name,
      image: entity.image,
      price: entity.price,
      quantity: entity.quantity,
      size: entity.size,
      color: entity.color,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  CartItem toEntity() {
    return CartItem(
      id: id,
      productId: productId,
      name: name,
      image: image,
      price: price,
      quantity: quantity,
      size: size,
      color: color,
    );
  }

  HiveCartItemModel copyWith({
    String? id,
    String? productId,
    String? name,
    String? image,
    double? price,
    int? quantity,
    String? color,
    String? size,
    bool? inStock,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HiveCartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      color: color ?? this.color,
      inStock: inStock ?? this.inStock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
