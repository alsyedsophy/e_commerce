class CartItem {
  final String id;
  final String productId;
  final String name;
  final String image;
  final double price;
  int quantity;
  final String size;
  final String color;
  final bool inStock;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
    this.inStock = true,
  });

  CartItem copyWith({
    String? id,
    String? productId,
    String? name,
    String? image,
    double? price,
    int? quantity,
    String? color,
    String? size,
    bool? inStock,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      color: color ?? this.color,
      inStock: inStock ?? this.inStock,
    );
  }

  double get totalPrice => price * quantity;
}
