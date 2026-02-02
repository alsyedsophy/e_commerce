import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

class FirebaseCartItemModel {
  final String id;
  final String productId;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String size;
  final String color;
  final bool inStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  FirebaseCartItemModel({
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

  factory FirebaseCartItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return FirebaseCartItemModel(
      id: data['id'] ?? doc.id,
      productId: data['productId'] ?? '',
      name: data['name'] ?? "",
      image: data['image'] ?? '',
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'] ?? 1,
      size: data['size'],
      color: data['color'],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'size': size,
      'color': color,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory FirebaseCartItemModel.fromEntity(CartItem entity) {
    return FirebaseCartItemModel(
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

  FirebaseCartItemModel copyWith({
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
    return FirebaseCartItemModel(
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
