import '../../core/supabase_constant.dart';
import '../providers/note_provider.dart';
import '../models/note_model.dart';

class NoteRepository {

  final NoteProvider _provider = NoteProvider();

  Future<List<NoteModel>> fetchAllNotes() async {
    final data = await _provider.fetchAllNotes();

    return data
        .map<NoteModel>((e) => NoteModel.fromJson(e))
        .toList();
  }

  Future<List<NoteModel>> fetchMyNotes() async {
    final userId = currentUser!.id;

    final data = await _provider.fetchMyNotes(userId);

    return data
        .map<NoteModel>((e) => NoteModel.fromJson(e))
        .toList();
  }

  Future<void> createNote(String title, String description) async {
    final userId = currentUser!.id;

    await _provider.createNote(userId, title, description);
  }

  Future<void> updateNote(
      String id, String title, String description) async {
    await _provider.updateNote(id, title, description);
  }

  Future<void> deleteNote(String id) async {
    await _provider.deleteNote(id);
  }
}
