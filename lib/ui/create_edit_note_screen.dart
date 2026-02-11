import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../data/models/note_model.dart';

class CreateEditNoteScreen extends StatefulWidget {
  final NoteModel? note;

  const CreateEditNoteScreen({super.key, this.note});

  @override
  State<CreateEditNoteScreen> createState() =>
      _CreateEditNoteScreenState();
}

class _CreateEditNoteScreenState
    extends State<CreateEditNoteScreen> {

  final NoteController controller = Get.find<NoteController>();

  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.note?.title ?? '');
    descController =
        TextEditingController(text: widget.note?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {

    final isEdit = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Note" : "Create Note"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 10),

                /// 🔹 Title Field
                const Text(
                  "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Enter note title",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// 🔹 Description Field
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                TextFormField(
                  controller: descController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write something...",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                /// 🔹 Save Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {

                      if (!_formKey.currentState!
                          .validate()) return;

                      if (isEdit) {
                        await controller.updateNote(
                          widget.note!.id,
                          titleController.text.trim(),
                          descController.text.trim(),
                        );
                      } else {
                        await controller.createNote(
                          titleController.text.trim(),
                          descController.text.trim(),
                        );
                      }

                      Get.back();
                    },
                    child: Text(
                      isEdit ? "Update Note" : "Create Note",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
