// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    double? discountPrice,
    required String categoryId,
    required String categoryName,
    required List<String> imageUrls,
    String? thumbnailUrl,
    required int stock,
    double rating = 0,
    int reviewCount = 0,
    bool isFeatured = false,
    bool isActive = true,
    required DateTime createdAt,
    Map<String, dynamic>? attributes,
  }) : super(
         id: id,
         name: name,
         description: description,
         price: price,
         discountPrice: discountPrice,
         categoryId: categoryId,
         categoryName: categoryName,
         imageUrls: imageUrls,
         thumbnailUrl: thumbnailUrl,
         stock: stock,
         rating: rating,
         reviewCount: reviewCount,
         isFeatured: isFeatured,
         isActive: isActive,
         createdAt: createdAt,
         attributes: attributes,
       );

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    List<String> listImages = [];
    if (data['imageUrls'] is List) {
      listImages = List<String>.from(data['imageUrls']);
    }

    Map<String, dynamic> attributes = {};
    if (data['attributes'] is Map) {
      attributes = Map<String, dynamic>.from(data['attributes']);
    }

    return ProductModel(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      price: data['price'] ?? 0,
      discountPrice: data['discountPrice'] ?? 0,
      categoryId: data['categoryId'],
      categoryName: data['categoryName'],
      imageUrls: listImages,
      thumbnailUrl: data['thumbnailUrl'] ?? '',
      stock: data['stock'] ?? 0,
      rating: data['rating'] ?? 0,
      reviewCount: data['reviewCount'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
      isActive: data['isActive'] ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      attributes: data['attributes'] ?? {},
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountPrice': discountPrice,
      'imageUrls': imageUrls,
      'thumbnailUrl': thumbnailUrl,
      'stock': stock,
      'rating': rating,
      'reviewCount': reviewCount,
      'isFeatured': isFeatured,
      'isActive': isActive,
      'createdAt': Timestamp.fromDate(createdAt),
      if (attributes != null) 'attributes': attributes,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
