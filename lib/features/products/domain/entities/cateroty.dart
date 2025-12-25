class Category {
  final String id;
  final String name;
  final String imageUrl;
  final bool isActive;
  final DateTime createdAt;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isActive,
    required this.createdAt,
  });

  Category copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
