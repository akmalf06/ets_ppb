import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/migrations/book_migration.dart';
import 'package:todoapp/models/book.dart';

class BookDatabase {
  static final BookDatabase instance = BookDatabase._init();

  static Database? _database;

  BookDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${BookTable.tableName} (
      ${BookTable.id} ${BookTable.columnTypeMapping[BookTable.id]},
      ${BookTable.title} ${BookTable.columnTypeMapping[BookTable.title]},
      ${BookTable.description} ${BookTable.columnTypeMapping[BookTable.description]},
      ${BookTable.coverUrl} ${BookTable.columnTypeMapping[BookTable.coverUrl]},
      ${BookTable.createdAt} ${BookTable.columnTypeMapping[BookTable.createdAt]},
    )
    ''');
  }

  Future<List<Book>> getAll() async {
    final db = await instance.database;
    final records = await db.query(BookTable.tableName);
    return records.map((json) => Book.fromJson(json)).toList();
  }

  Future<Book> find(int id) async {
    final db = await instance.database;

    final records = await db.query(
      BookTable.tableName,
      columns: BookTable.columns,
      where: '${BookTable.id} = ?',
      whereArgs: [id]
    );

    if(records.isNotEmpty) {
      return Book.fromJson(records.first);
    } else {
      throw Exception('ID $id not found!');
    }
  }

  Future<Book> create(Book book) async {
    final db = await instance.database;
    final id = await db.insert(BookTable.tableName, book.toJson());
    return book.copy(id: id);
  }

  Future<int> update (Book book) async {
    final db = await instance.database;

    return await db.update(
      BookTable.tableName,
      book.toJson(),
      where: '${BookTable.id} = ?',
      whereArgs: [book.id]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      BookTable.tableName,
      where: '${BookTable.id} = ?',
      whereArgs: [id]
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}