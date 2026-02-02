class CartTotal {
  final double subtotal;
  final double shipping;
  final double discount;
  final int totalItems;
  final bool allInStock;

  CartTotal({
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.totalItems,
    required this.allInStock,
  });

  double get total => subtotal + shipping - discount;
}
