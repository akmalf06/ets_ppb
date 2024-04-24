class BookTable {
  static final String tableName = 'books';

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String coverUrl = 'cover_url';
  static final String createdAt = 'created_at';

  static final List<String> columns = [
    id, title, description, coverUrl, createdAt
  ];

  static final Map<String, String> columnTypeMapping = {
    id: 'INTEGER PRIMARY KEY AUTOINCREMENT',
    title: 'TEXT NOT NULL',
    description: 'TEXT NOT NULL',
    coverUrl: 'TEXT NOT NULL',
    createdAt: 'TEXT NOT NULL',
  };
}