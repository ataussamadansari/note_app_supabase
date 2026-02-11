import '../../core/supabase_constant.dart';

class AuthProvider {

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {

    final response = await supabaseAuth.signUp(
      email: email,
      password: password,
    );

    final userId = response.user!.id;

    await supabase.from('users').insert({
      'name': name,
      'email': email,
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}