import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constants/firebase_constants.dart';
import 'package:e_commerce/features/cart/data/model/remote%20model/firebase_cart_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CartRemoteDateaSource {
  Future<void> syncCart(List<FirebaseCartItemModel> items);
  Future<List<FirebaseCartItemModel>> getServerCart();
  Future<void> removeFromCart(FirebaseCartItemModel cartItem);
  Future<void> updateServerCart(FirebaseCartItemModel cartItem);
  Future<void> clearCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDateaSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  CartRemoteDataSourceImpl(
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
  ) : _firestore = firestore ?? FirebaseFirestore.instance,
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // =============== Healper Methods ==============
  String get _userId => _firebaseAuth.currentUser?.uid ?? '';
  CollectionReference get _collectionCartRef => _firestore
      .collection(FirebaseConstants.cartsCollection)
      .doc(_userId)
      .collection('items');
  String _cartKey(FirebaseCartItemModel item) =>
      "${item.id}_${item.size}_${item.color}";

  // ================ Override Methods =================
  @override
  Future<void> clearCart() async {
    try {
      if (_userId.isEmpty) throw Exception('أنت لم تسجل بعد');
      final batch = _firestore.batch();
      final snapshot = await _collectionCartRef.get();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    }
  }

  @override
  Future<List<FirebaseCartItemModel>> getServerCart() async {
    try {
      if (_userId.isEmpty) throw Exception('أنت لم تسجل بعد');
      final quarySnapshot = await _collectionCartRef.get();
      return quarySnapshot.docs
          .map((doc) => FirebaseCartItemModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    }
  }

  @override
  Future<void> removeFromCart(FirebaseCartItemModel cartItem) async {
    try {
      if (_userId.isEmpty) throw Exception('أنت لم تسجل بعد');
      await _collectionCartRef.doc(_cartKey(cartItem)).delete();
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    }
  }

  @override
  Future<void> syncCart(List<FirebaseCartItemModel> items) async {
    try {
      if (_userId.isEmpty) throw Exception('أنت لم تسجل بعد');
      final batch = _firestore.batch();
      final existingItems = await _collectionCartRef.get();
      for (final doc in existingItems.docs) {
        batch.delete(doc.reference);
      }
      for (final item in items) {
        final itemRef = _collectionCartRef.doc(_cartKey(item));
        batch.set(itemRef, item.toFirestore());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    }
  }

  @override
  Future<void> updateServerCart(FirebaseCartItemModel cartItem) async {
    try {
      if (_userId.isEmpty) throw Exception('أنت لم تسجل بعد');
      await _collectionCartRef
          .doc(_cartKey(cartItem))
          .set(cartItem.toFirestore(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    }
  }
}
