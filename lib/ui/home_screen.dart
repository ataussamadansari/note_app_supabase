import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../controllers/like_controller.dart';
import '../core/supabase_constant.dart';
import 'profile_screen.dart';
import 'create_edit_note_screen.dart';

class HomeScreen extends StatelessWidget {

  final NoteController controller = Get.put(NoteController());
  final LikeController likeController = Get.find<LikeController>();

  final String userId = currentUser!.id;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.to(() => ProfileScreen()),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CreateEditNoteScreen()),
        child: const Icon(Icons.add),
      ),

      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.notes.length,
        itemBuilder: (context, index) {

          final note = controller.notes[index];
          final isMine = note.userId == userId;

          // Initialize like state
          likeController.initLike(note.id);

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔹 Title
                  Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// 🔹 Description
                  Text(
                    note.description,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 12),

                  /// 🔹 Bottom Row (Like + Actions)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// ❤️ LIKE SECTION
                      Obx(() {
                        final liked =
                            likeController.likedStatus[note.id] ?? false;

                        return Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: liked ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                likeController.toggleLike(
                                  noteId: note.id,
                                  currentLikeCount: note.likeCount,
                                  onCountChanged: (newCount) {
                                    controller.updateLocalLikeCount(
                                      note.id,
                                      newCount,
                                    );
                                  },
                                );
                              },
                            ),
                            Text(
                              "${note.likeCount} likes",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        );
                      }),

                      /// ✏️ EDIT / DELETE (Only Own)
                      if (isMine)
                        PopupMenuButton(
                          onSelected: (value) {
                            if (value == 'edit') {
                              Get.to(() =>
                                  CreateEditNoteScreen(note: note));
                            } else {
                              controller.deleteNote(note.id);
                            }
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                                value: 'edit', child: Text("Edit")),
                            PopupMenuItem(
                                value: 'delete', child: Text("Delete")),
                          ],
                        ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
