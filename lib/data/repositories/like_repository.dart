import '../../core/supabase_constant.dart';
import '../providers/like_provider.dart';

class LikeRepository {

  final LikeProvider _provider = LikeProvider();

  Future<bool> isLiked(String noteId) async {
    final userId = currentUser!.id;
    return _provider.isLiked(noteId, userId);
  }

  Future<bool> toggleLike(String noteId) async {
    final userId = currentUser!.id;

    final alreadyLiked =
    await _provider.isLiked(noteId, userId);

    if (alreadyLiked) {
      await _provider.unlike(noteId, userId);
      return false;
    } else {
      await _provider.like(noteId, userId);
      return true;
    }
  }
}
