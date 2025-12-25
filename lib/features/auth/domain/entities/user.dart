class User {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final DateTime createdAt;
  final bool isEmailVerified;

  User({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.createdAt,
    required this.isEmailVerified,
  });

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    DateTime? createdAt,
    bool? isEmailVerified,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdAt: createdAt ?? this.createdAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  // دوال مساعده
  bool hasProfileChanges({String? newFirstName, String? newLastName}) {
    return (newFirstName != null && newFirstName != firstName) ||
        (newLastName != null && newLastName != lastName);
  }

  String get fullName => "$firstName $lastName";
}
