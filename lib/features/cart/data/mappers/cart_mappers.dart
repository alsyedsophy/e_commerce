import 'package:e_commerce/features/cart/data/model/local%20model/cart_item_model.dart';
import 'package:e_commerce/features/cart/data/model/remote%20model/firebase_cart_item_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

class CartMappers {
  static HiveCartItemModel toHoveModel(CartItem entity) {
    return HiveCartItemModel.fromEntity(entity);
  }

  static CartItem fromHiveModel(HiveCartItemModel model) {
    return model.toEntity();
  }

  static FirebaseCartItemModel toFirestoreModel(CartItem entity) {
    return FirebaseCartItemModel.fromEntity(entity);
  }

  static CartItem fromFirestoreModel(FirebaseCartItemModel model) {
    return model.toEntity();
  }

  static HiveCartItemModel firestoreToHiveModel(FirebaseCartItemModel model) {
    return HiveCartItemModel(
      id: model.id,
      productId: model.productId,
      name: model.name,
      image: model.image,
      price: model.price,
      quantity: model.quantity,
      size: model.size,
      color: model.color,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static FirebaseCartItemModel hiveToFirestore(HiveCartItemModel model) {
    return FirebaseCartItemModel(
      id: model.id,
      productId: model.productId,
      name: model.name,
      image: model.image,
      price: model.price,
      quantity: model.quantity,
      size: model.size,
      color: model.color,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
