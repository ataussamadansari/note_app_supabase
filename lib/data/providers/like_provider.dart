
import '../../core/supabase_constant.dart';

class LikeProvider {

  Future<bool> isLiked(String noteId, String userId) async {
    final data = await supabase
        .from('likes')
        .select()
        .eq('note_id', noteId)
        .eq('user_id', userId)
        .maybeSingle();

    return data != null;
  }

  Future<void> like(String noteId, String userId) async {
    await supabase.from('likes').insert({
      'note_id': noteId,
      'user_id': userId,
    });
  }

  Future<void> unlike(String noteId, String userId) async {
    await supabase
        .from('likes')
        .delete()
        .eq('note_id', noteId)
        .eq('user_id', userId);
  }
}
