import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    String? firstName,
    String? lastName,
    required DateTime createdAt,
    bool isEmailVerified = false,
  }) : super(
         id: id,
         email: email,
         firstName: firstName,
         lastName: lastName,
         createdAt: createdAt,
         isEmailVerified: isEmailVerified,
       );

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserModel(
      id: doc.id,
      email: data["email"] ?? "",
      firstName: data["firstName"],
      lastName: data["lastName"],
      createdAt: (data["createdAt"] as Timestamp?)?.toDate() ?? DateTime.now(),
      isEmailVerified: data['isEmailVerified'] ?? false,
    );
  }

  factory UserModel.fromFirebaseUser(firebase.User user) {
    final displayName = user.displayName; // استخراج مرة واحدة

    String? firstName;
    String? lastName;

    if (displayName != null) {
      final parts = displayName.trim().split(' ');
      if (parts.isNotEmpty) {
        firstName = parts.first;
      }
      if (parts.length > 1) {
        lastName = parts.last;
      }
    }
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      firstName: firstName,
      lastName: lastName,
      createdAt: user.metadata.creationTime ?? DateTime.now(),
      isEmailVerified: user.emailVerified,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "createdAt": createdAt,
      "updatedAt": FieldValue.serverTimestamp(),
      "isEmailVerified": isEmailVerified,
    };
  }
}
