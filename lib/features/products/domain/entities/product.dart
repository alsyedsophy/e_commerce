class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int? discountPresentage;
  final String categoryId;
  final String categoryName;
  final List<String> imageUrls;
  final String? thumbnailUrl;
  final int stock;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final Map<String, dynamic>? attributes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPresentage,
    required this.categoryId,
    required this.categoryName,
    required this.imageUrls,
    required this.thumbnailUrl,
    required this.stock,
    required this.rating,
    required this.reviewCount,
    required this.isFeatured,
    required this.isActive,
    required this.createdAt,
    required this.attributes,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? discountPresentage,
    String? categoryId,
    String? categoryName,
    List<String>? imageUrls,
    String? thumbnailUrl,
    int? stock,
    double? rating,
    int? reviewCount,
    bool? isFeatured,
    bool? isActive,
    DateTime? createdAt,
    Map<String, dynamic>? attributes,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPresentage: discountPresentage ?? this.discountPresentage,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      imageUrls: imageUrls ?? this.imageUrls,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFeatured: isFeatured ?? this.isFeatured,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      attributes: attributes ?? this.attributes,
    );
  }

  bool get isStock => stock > 0;
  bool get hasDiscount => discountPresentage != null;
  double get finalPrice =>
      hasDiscount ? (price - ((price / 100) * discountPresentage!)) : price;

  // int get discountPresentage {
  //   if (!hasDiscount) return 0;
  //   return (((price - discountPrice!) / price) * 100).round();
  // }

  String get firstImage => imageUrls.isNotEmpty ? imageUrls.first : "";
}
