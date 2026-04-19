class AppRegex {
  static bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static bool hasMinLength(String password, int minLength) {
    return password.length >= minLength;
  }

  static bool hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  static bool hasSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
