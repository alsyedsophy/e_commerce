class CartItem {
  final String id;
  final String name;
  final String image;
  final double price;
  int quantity;
  final String size;
  final String color;
  final int stock;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
    required this.stock,
  });

  CartItem copyWith({int? quantity, String? size, String? color}) {
    return CartItem(
      id: id,
      name: name,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      color: color ?? this.color,
      stock: stock,
    );
  }

  double get totalPrice => price * quantity;
}
