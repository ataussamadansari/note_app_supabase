
import '../../core/supabase_constant.dart';

class NoteProvider {

  Future<List<Map<String, dynamic>>> fetchAllNotes() async {
    return await supabase
        .from('notes')
        .select()
        .order('created_at', ascending: false);
  }

  Future<List<Map<String, dynamic>>> fetchMyNotes(String userId) async {
    return await supabase
        .from('notes')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
  }

  Future<void> createNote(
      String userId, String title, String description) async {
    await supabase.from('notes').insert({
      'user_id': userId,
      'title': title,
      'description': description,
    });
  }

  Future<void> updateNote(
      String id, String title, String description) async {
    await supabase.from('notes').update({
      'title': title,
      'description': description,
    }).eq('id', id);
  }

  Future<void> deleteNote(String id) async {
    await supabase.from('notes').delete().eq('id', id);
  }
}
