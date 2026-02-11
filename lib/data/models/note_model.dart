class NoteModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final int likeCount;

  NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.likeCount,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
    );
  }


  NoteModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    int? likeCount,
  }) {
    return NoteModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      likeCount: likeCount ?? this.likeCount,
    );
  }

}
