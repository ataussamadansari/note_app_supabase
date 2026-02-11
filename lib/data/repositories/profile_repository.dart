import '../../core/supabase_constant.dart';
import '../models/user_model.dart';
import '../providers/profile_provider.dart';

class ProfileRepository {

  final ProfileProvider _provider = ProfileProvider();

  Future<UserModel> fetchProfile() async {
    final userId = currentUser!.id;

    final data = await _provider.fetchUser(userId);

    return UserModel.fromJson(data);
  }

  Future<void> updateProfile(String name) async {
    final userId = currentUser!.id;

    await _provider.updateUser(
      userId: userId,
      name: name,
    );
  }
}
