mixin AuthValidatorMixin {
  // 📌 1. التحقق من البريد الإلكتروني
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    if (!email.contains('@')) {
      return 'البريد الإلكتروني غير صالح';
    }

    // يمكن إضافة المزيد من التحقق
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }

    return null; // ✅ صالح
  }

  // 📌 2. التحقق من كلمة المرور
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (password.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }

    return null; // ✅ صالح
  }

  // 📌 3. التحقق من الاسم
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'الاسم مطلوب';
    }

    if (name.length < 2) {
      return 'يجب أن يكون حرفين على الأقل';
    }

    return null; // ✅ صالح
  }

  // 📌 4. تحقق شامل للتسجيل
  String? validateRegistration({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    // تحقق من البريد
    final emailError = validateEmail(email);
    if (emailError != null) return emailError;

    // تحقق من كلمة المرور
    final passwordError = validatePassword(password);
    if (passwordError != null) return passwordError;

    // تحقق من الاسم الأول
    final firstNameError = validateName(firstName);
    if (firstNameError != null) return firstNameError;

    // تحقق من الاسم الأخير
    final lastNameError = validateName(lastName);
    if (lastNameError != null) return lastNameError;

    return null; // ✅ كل شيء صالح
  }

  // 📌 5. تحقق شامل لتسجيل الدخول
  String? validateLogin({required String email, required String password}) {
    final emailError = validateEmail(email);
    if (emailError != null) return emailError;

    final passwordError = validatePassword(password);
    if (passwordError != null) return passwordError;

    return null; // ✅ كل شيء صالح
  }
}
