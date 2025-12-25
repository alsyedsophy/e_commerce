import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String id,
    required String name,
    required String imageUrl,
    bool isActive = true,
    required DateTime createdAt,
  }) : super(
         id: id,
         name: name,
         imageUrl: imageUrl,
         isActive: isActive,
         createdAt: createdAt,
       );

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return CategoryModel(
      id: doc.id,
      name: data['name'],
      imageUrl: data['imageUrl'],
      isActive: data['isActive'] ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isActive': isActive,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
