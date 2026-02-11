import '../providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider = AuthProvider();

  Future<void> register(String name, String email, String password) {
    return provider.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> login(String email, String password) {
    return provider.login(
      email: email,
      password: password,
    );
  }

  Future<void> logout() {
    return provider.logout();
  }
}
