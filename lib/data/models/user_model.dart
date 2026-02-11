class UserModel {
  final String id;
  final String name;
  final String email;
  final int notesCount;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.notesCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      notesCount: json['notes_count'] ?? 0,
    );
  }
}
