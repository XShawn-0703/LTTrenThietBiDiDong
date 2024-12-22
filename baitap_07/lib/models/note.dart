// lib/models/note.dart
class Note {
  final int? id;
  final String title;
  final String content;
  final String username;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.username,
  });

  // Chuyển đối tượng Note thành Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'username': username,
    };
  }

  // Khôi phục đối tượng Note từ Map
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      username: map['username'],
    );
  }
}
