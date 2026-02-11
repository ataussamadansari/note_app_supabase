import 'package:get/get.dart';
import '../data/models/note_model.dart';
import '../data/models/user_model.dart';
import '../data/repositories/profile_repository.dart';
import '../data/repositories/note_repository.dart';

class ProfileController extends GetxController {

  final ProfileRepository _profileRepo = ProfileRepository();
  final NoteRepository _noteRepo = NoteRepository();

  Rxn<UserModel> user = Rxn<UserModel>();
  RxList<NoteModel> notes = <NoteModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;

      user.value = await _profileRepo.fetchProfile();
      notes.value = await _noteRepo.fetchMyNotes();

    } finally {
      isLoading.value = false;
    }
  }
}
