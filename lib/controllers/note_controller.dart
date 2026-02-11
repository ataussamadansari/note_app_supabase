import 'package:get/get.dart';
import '../data/repositories/note_repository.dart';
import '../data/models/note_model.dart';
import 'like_controller.dart';

class NoteController extends GetxController {
  final repo = NoteRepository();
  final likeController = Get.find<LikeController>();

  RxList<NoteModel> notes = <NoteModel>[].obs;

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  Future<void> fetchNotes() async {
    notes.value = await repo.fetchAllNotes();
  }

  Future<void> createNote(String title, String desc) async {
    await repo.createNote(title, desc);
    fetchNotes();
  }

  Future<void> updateNote(
      String id, String title, String desc) async {
    await repo.updateNote(id, title, desc);
    fetchNotes();
  }

  Future<void> deleteNote(String id) async {
    await repo.deleteNote(id);
    fetchNotes();
  }

  void updateLocalLikeCount(String noteId, int newCount) {
    final index =
    notes.indexWhere((element) => element.id == noteId);

    if (index != -1) {
      final note = notes[index];

      notes[index] = note.copyWith(
        likeCount: newCount,
      );
    }
  }

}
