import 'dart:developer';

import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';

// abstract Class
abstract class AuthRemoteDataSource {
  Stream<User?> get authStateChange;
  Future<User> signinWithEmail(String email, String password);
  Future<User> signinWithGoolge();
  Future<User> register(
    String email,
    String password,
    String firstName,
    String lastname,
  );
  Future<User?> getCurrentUser();
  Future<User> updateProfile(String? firstName, String? lastName);
  Future<void> sentPasswordResetEmail(String email);
  Future<void> logout();
}

// Implamentation
class AuthRemoteDataSoureImpl implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  AuthRemoteDataSoureImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> _intializeGoogleSignIn() async {
    await _googleSignIn.initialize(
      clientId: null,
      serverClientId:
          "748817817158-874n12ks55foc0dfpu46grurlap358hl.apps.googleusercontent.com",
    );
  }

  // تسجيل الدخول باستخدام البريد الاكترونى وكلمة المرور
  @override
  Future<User> signinWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return await _getOrCreateInFirestore(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handelFirebaseAuthExcwption(e);
    }
  }

  // تسجسل الدخوا باستخدام جوجل
  @override
  Future<User> signinWithGoolge() async {
    try {
      await _intializeGoogleSignIn();
      final googleUser = await _googleSignIn.authenticate(scopeHint: ['email']);
      final googleAuth = googleUser.authentication;
      final authClient = _googleSignIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      return await _getOrCreateInFirestore(userCredential.user!);
    } on GoogleSignInException catch (e) {
      throw _handelGoogleSignIn(e);
    } catch (e) {
      throw Exception("فشل تسجيل الدخول باستخدام جوجل الرساله من ال catch");
    }
  }

  // انشاء حساب جديد باستخدام البريد الاكترونى وكلمة المرور
  @override
  Future<User> register(
    String email,
    String password,
    String firstName,
    String lastname,
  ) async {
    try {
      final userCredintial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredintial.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastname,
        createdAt: DateTime.now(),
        isEmailVerified: false,
      );

      await _firestore
          .collection('users')
          .doc(userCredintial.user!.uid)
          .set(user.toFirestore());
      return user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handelFirebaseAuthExcwption(e);
    }
  }

  // ارسال بريد للتحقق من صحة البريد
  @override
  Future<void> sentPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // تحديث الملف الشخصلى
  @override
  Future<User> updateProfile(String? firstName, String? lastName) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception("You must be register first");
      }
      final userDoc = _firestore.collection('users').doc(currentUser.uid);
      final updateData = <String, dynamic>{
        'updatedAt': FieldValue.serverTimestamp(),
      };
      if (firstName != null) updateData['firstName'] = firstName;
      if (lastName != null) updateData['lastName'] = lastName;

      await userDoc.update(updateData);
      final updatedDoc = await userDoc.get();
      return UserModel.fromFirestore(updatedDoc);
    } catch (e) {
      throw Exception("Faild To Update Profile");
    }
  }

  // الحصول على المستخدم الحالى
  @override
  Future<User?> getCurrentUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) return null;
    final userDoc = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .get();
    if (userDoc.exists) {
      return UserModel.fromFirestore(userDoc);
    }
    return null;
  }

  // التحقق من حالة المستخدم الحالى هل هو مسجل دخول ام لا
  @override
  Stream<User?> get authStateChange {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return null;
      }
      try {
        final userDoc = await _firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .get();
        if (userDoc.exists) {
          return UserModel.fromFirestore(userDoc);
        }
        return null;
      } catch (e) {
        return null;
      }
    });
  }

  // تسجيل الخروج
  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  // تحصل على المستخدم من الفايربيز او تنشأه اذا لم يكن موجود
  Future<User> _getOrCreateInFirestore(firebase_auth.User firebaseUser) async {
    final userDoc = await _firestore
        .collection('users')
        .doc(firebaseUser.uid)
        .get();
    if (userDoc.exists) {
      return UserModel.fromFirestore(userDoc);
    } else {
      final user = UserModel.fromFirebaseUser(firebaseUser);

      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(user.toFirestore());
      return user;
    }
  }

  // بتهندل ال exception الراجع من ال firebaseAuth
  Exception _handelFirebaseAuthExcwption(
    firebase_auth.FirebaseAuthException e,
  ) {
    switch (e.code) {
      case "user-not-found":
        return Exception("the User is not found");
      case 'wrong-password':
        return Exception("The Password is Wrong");
      case 'email-already-in-use':
        return Exception("Email Already In Use");
      case 'invalid-email':
        return Exception("email is not validation");
      case 'weak-password':
        return Exception("The Password Is Very Weak");
      case 'network-request-failed':
        return Exception('Check The Enternet Connection');
      default:
        return Exception(e.message ?? "Something Wrong Throw Authintecation");
    }
  }

  // Exception بتهندل الراجع من Google Sign in
  Exception _handelGoogleSignIn(GoogleSignInException e) {
    switch (e.code) {
      case GoogleSignInExceptionCode.canceled:
        return Exception("Google Sign in is Canceld");
      case GoogleSignInExceptionCode.interrupted:
        return Exception("Google sign in is Interrupted");
      case GoogleSignInExceptionCode.uiUnavailable:
        return Exception("This device Not Allow To Google Sign in");
      default:
        log("e.description : ${e.description} - e.details : ${e.details}");
        return Exception(
          "Faild To Sign in By Google ${e.description} - ${e.details}",
        );
    }
  }
}
