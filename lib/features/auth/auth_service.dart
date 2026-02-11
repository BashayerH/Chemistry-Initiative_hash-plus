import 'dart:async';

class AuthService {
  // In-memory user store: email -> {name, password}
  static final Map<String, Map<String, String>> _users = {};

  static Future<String?> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final key = email.toLowerCase();
    if (_users.containsKey(key)) {
      return 'الحساب موجود بالفعل لهذا الإيميل';
    }
    _users[key] = {
      'name': fullName,
      'password': password,
    };
    return null;
  }

  static Future<bool> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final key = email.toLowerCase();
    if (!_users.containsKey(key)) return false;
    return _users[key]!['password'] == password;
  }

  static bool userExists(String email) {
    return _users.containsKey(email.toLowerCase());
  }
}
