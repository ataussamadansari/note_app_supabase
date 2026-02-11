import '../../core/supabase_constant.dart';

class ProfileProvider {

  Future<Map<String, dynamic>> fetchUser(String userId) async {
    return await supabase
        .from('users')
        .select()
        .eq('id', userId)
        .single();
  }

  Future<void> updateUser({
    required String userId,
    required String name,
  }) async {
    await supabase
        .from('users')
        .update({
      'name': name,
    })
        .eq('id', userId);
  }
}
