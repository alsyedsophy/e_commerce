import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/features/cart/data/model/local%20model/cart_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCartItemModelAdapter());
    await Hive.openBox<HiveCartItemModel>(AppConstants.cartBoxName);
  }
}
