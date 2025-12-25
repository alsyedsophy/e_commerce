import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

class Failures extends Equatable {
  final String message;
  final String code;

  const Failures({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() => "$code - $message";
}

// Network Failures
class NetworkFailure extends Failures {
  const NetworkFailure(String message)
    : super(message: message, code: "NETWORK_FAILURE");
}

class ServerFailure extends Failures {
  const ServerFailure(String message)
    : super(message: message, code: "SERVER_FAILURE");
}

// Firebase Failures
class AuthFailure extends Failures {
  const AuthFailure(String message)
    : super(message: message, code: "AUTH_FAILURE");
}

class FirestoreFailure extends Failures {
  const FirestoreFailure(String message)
    : super(message: message, code: "FIRESTORE_FAILURE");
}

class StorageFailure extends Failures {
  const StorageFailure(String message)
    : super(message: message, code: "STORAGE_FAILURE");
}

// Local Failures
class CacheFailure extends Failures {
  const CacheFailure(String message)
    : super(message: message, code: "CACHE_FAILURE");
}

class HiveFailure extends Failures {
  const HiveFailure(String message)
    : super(message: message, code: "HIVE_FAILURE");
}

// Validation Failures
class InvalidInputFailure extends Failures {
  const InvalidInputFailure(String message)
    : super(message: message, code: "VALIDATION_FAILURE");
}

class InvaledEmailFailure extends Failures {
  const InvaledEmailFailure()
    : super(
        message: "البريد الالكترونى غير صالح",
        code: "INVALID_EMAIL_FAILURE",
      );
}

class WeekPasswordFailure extends Failures {
  const WeekPasswordFailure()
    : super(message: "كلمة المرور ضعيفه", code: "WEEK_PASSWORD_FAILURE");
}

// Business Logic Failures
class OutOfStockFailure extends Failures {
  const OutOfStockFailure()
    : super(
        message: 'المنتج غير متوفر فى المخزن',
        code: "OUT_OF_STOCK_FAILURE",
      );
}

class InsufficientFundsFailure extends Failures {
  const InsufficientFundsFailure()
    : super(message: "الرصيد غير كافى", code: "INSUFFICIENT_FUNDS_FAILURE");
}

// Helper لتحويل Exceptions إلى Failures
Failures mapExceptionToFailure(Exception exception) {
  if (exception is AppExceptions) {
    switch (exception.code) {
      case 'NETWORK_ERROR':
        return NetworkFailure(exception.message);
      case 'FIREBASE_AUTH_ERROR':
        return AuthFailure(exception.message);
      case 'FIRESTORE_ERROR':
        return FirestoreFailure(exception.message);
      case 'VALIDATION_ERROR':
        return InvalidInputFailure(exception.message);
      default:
        return ServerFailure(exception.message);
    }
  }
  return ServerFailure('حدث خطأ غير متوقع');
}
