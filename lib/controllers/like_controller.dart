import 'package:get/get.dart';
import '../data/repositories/like_repository.dart';

class LikeController extends GetxController {

  final LikeRepository _repo = LikeRepository();

  /// noteId → liked status
  RxMap<String, bool> likedStatus = <String, bool>{}.obs;

  /// noteId → loading state
  RxSet<String> loadingNotes = <String>{}.obs;

  /// Initialize like status for a note
  Future<void> initLike(String noteId) async {
    if (likedStatus.containsKey(noteId)) return;

    final isLiked = await _repo.isLiked(noteId);
    likedStatus[noteId] = isLiked;
  }

  /// Toggle Like (Production Safe)
  Future<void> toggleLike({
    required String noteId,
    required int currentLikeCount,
    required Function(int newCount) onCountChanged,
  }) async {

    if (loadingNotes.contains(noteId)) return; // prevent spam tap

    loadingNotes.add(noteId);

    try {
      final newStatus = await _repo.toggleLike(noteId);

      likedStatus[noteId] = newStatus;

      // Optimistic count update
      final updatedCount =
      newStatus ? currentLikeCount + 1 : currentLikeCount - 1;

      onCountChanged(updatedCount);

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingNotes.remove(noteId);
    }
  }
}
