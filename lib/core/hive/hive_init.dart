import 'package:e_commerce/features/cart/data/model/cart_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartItemModelAdapter());
    await Hive.openBox<CartItemModel>('cart_box');
  }
}
