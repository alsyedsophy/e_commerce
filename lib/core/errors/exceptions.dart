class AppExceptions implements Exception {
  final String message;
  final String code;

  AppExceptions({required this.message, required this.code});

  @override
  String toString() => "AppException $code - $message";
}

// استثناءات الشبكه
class NetworkException extends AppExceptions {
  NetworkException(String messagge)
    : super(message: messagge, code: "NETWORK_ERROR");
}

class TimeoutException extends AppExceptions {
  TimeoutException(String message)
    : super(message: message, code: "TIMEOUT_ERROR");
}

// استثناءات ال firebase
class FirebaseAuthException extends AppExceptions {
  FirebaseAuthException(String message)
    : super(message: message, code: "FIREBASE_AUTH_ERROR");
}

class FirestoreException extends AppExceptions {
  FirestoreException(String message)
    : super(message: message, code: "FIRESTORE_ERROR");
}

class StorageExceprion extends AppExceptions {
  StorageExceprion(String message)
    : super(message: message, code: "SRORAGE_ERROR");
}

// استثناءات التحقق
class ValedationException extends AppExceptions {
  ValedationException(String message)
    : super(message: message, code: "VALEDATION_ERROR");
}

// استثناءات البيانات
class DataNotFoundException extends AppExceptions {
  DataNotFoundException(String message)
    : super(message: message, code: "DATA_NOT_FOUND_ERROR");
}

class DataParsingException extends AppExceptions {
  DataParsingException(String message)
    : super(message: message, code: "DATA_PARSING_ERROR");
}

// استثناءات المستخدم
class UnauthotizedException extends AppExceptions {
  UnauthotizedException(String message)
    : super(message: message, code: "UNATHORIZED_ERROR");
}

class PermissionDeniedException extends AppExceptions {
  PermissionDeniedException(String message)
    : super(message: message, code: "PERMISSION_DENIED_ERROR");
}
