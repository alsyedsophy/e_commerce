import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constants/firebase_constants.dart';
import 'package:e_commerce/features/products/data/model/category_model.dart';
import 'package:e_commerce/features/products/data/model/product_model.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts({
    int limit = 20,
    String? lastDocumentId,
  });
  Future<List<Product>> getProductsByCategoryId(
    String categoryId, {
    int limit = 10,
  });
  Future<List<Product>> getFeaturedProducts({int limit = 10});
  Future<List<Product>> getNewProducts({int limit = 20});
  Future<Product> productDetails(String productId);
  Future<List<Product>> searchProducts(String query);

  Future<List<Category>> getCategoris({int limit = 10});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore _firestore;
  ProductRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;
  @override
  Future<List<Product>> getAllProducts({
    int limit = 20,
    String? lastDocumentId,
  }) async {
    try {
      Query query = _firestore
          .collection(FirebaseConstants.productsCollection)
          .where('isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (lastDocumentId != null) {
        final doc = await _firestore
            .collection(FirebaseConstants.productsCollection)
            .doc(lastDocumentId)
            .get();

        if (doc.exists) {
          query = query.startAfterDocument(doc);
        }
      }
      final querySnapshot = await query.get();
      return _mapQuerySnapshotToProduct(querySnapshot);
    } catch (e) {
      throw Exception("Fiekd To Gett All Products : $e");
    }
  }

  @override
  Future<List<Product>> getFeaturedProducts({int limit = 10}) async {
    try {
      final querySnapshot = await _firestore
          .collection(FirebaseConstants.productsCollection)
          .where('isActive', isEqualTo: true)
          .where('isFeatured', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();
      return _mapQuerySnapshotToProduct(querySnapshot);
    } catch (e) {
      log(e.toString());
      throw Exception("Faild To Get Featured Products : $e");
    }
  }

  @override
  Future<List<Product>> getNewProducts({int limit = 20}) async {
    try {
      final weekAgo = DateTime.now().subtract(const Duration(days: 7));
      final querySnapshot = await _firestore
          .collection(FirebaseConstants.productsCollection)
          .where('isActive', isEqualTo: true)
          .where(
            'createdAt',
            isGreaterThanOrEqualTo: Timestamp.fromDate(weekAgo),
          )
          .orderBy('createdAt', descending: true)
          .get();
      return _mapQuerySnapshotToProduct(querySnapshot);
    } catch (e) {
      throw Exception("Faild To Get New Products : $e");
    }
  }

  @override
  Future<List<Product>> getProductsByCategoryId(
    String categoryId, {
    int limit = 10,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection(FirebaseConstants.productsCollection)
          .where('isActive', isEqualTo: true)
          .where('categoryId', isEqualTo: categoryId)
          .orderBy('createdAt', descending: true)
          .get();

      return _mapQuerySnapshotToProduct(querySnapshot);
    } catch (e) {
      throw Exception("Faild To Get Products Of this Category : $e");
    }
  }

  @override
  Future<Product> productDetails(String productId) async {
    try {
      final doc = await _firestore
          .collection(FirebaseConstants.productsCollection)
          .doc(productId)
          .get();
      if (!doc.exists) {
        throw Exception("This Product Not Found");
      }
      return ProductModel.fromFirestore(doc);
    } catch (e) {
      throw Exception("Failt To Get This Ptoduct : $e");
    }
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    try {
      if (query.isEmpty) return [];
      final querySnapshot = await _firestore
          .collection(FirebaseConstants.productsCollection)
          .where('isActive', isEqualTo: true)
          .where('name', isGreaterThanOrEqualTo: query.toLowerCase())
          .where('name', isLessThanOrEqualTo: '${query.toLowerCase()}\uf8ff')
          .get();
      return _mapQuerySnapshotToProduct(querySnapshot);
    } catch (e) {
      throw Exception("Faild To Search about This Query");
    }
  }

  @override
  Future<List<Category>> getCategoris({int limit = 10}) async {
    try {
      final querySnapshot = await _firestore
          .collection(FirebaseConstants.categoriesCollection)
          .where('isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .get();
      return _mapQuerySnapshotToCategory(querySnapshot);
    } catch (e) {
      throw Exception("Faild To Get Categories : $e");
    }
  }

  List<Product> _mapQuerySnapshotToProduct(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((product) => ProductModel.fromFirestore(product))
        .toList();
  }

  List<Category> _mapQuerySnapshotToCategory(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => CategoryModel.fromFirestore(doc))
        .toList();
  }
}
