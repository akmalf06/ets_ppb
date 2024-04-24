import 'package:todoapp/migrations/book_migration.dart';

class Book {
  final int? id;
  final String title;
  final String description;
  final String coverUrl;
  final DateTime createdAt;

  Book({
    this.id,
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.createdAt,
  });

  Map<String, Object?> toJson() => {
    BookTable.id: this.id,
    BookTable.title: this.title,
    BookTable.description: this.description,
    BookTable.coverUrl: this.coverUrl,
    BookTable.createdAt: this.createdAt.toIso8601String()
  };

  static Book fromJson(Map<String, Object?> json) => Book(
    id: json[BookTable.id] as int?,
    title: json[BookTable.title] as String,
    description: json[BookTable.description] as String,
    coverUrl: json[BookTable.coverUrl] as String,
    createdAt: DateTime.parse(json[BookTable.createdAt] as String),
  );

  Book copy({
    int? id,
    String? title,
    String? description,
    String? coverUrl,
    DateTime? createdAt,
  }) => Book(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      coverUrl: coverUrl ?? this.coverUrl,
      createdAt: createdAt ?? this.createdAt
  );
}