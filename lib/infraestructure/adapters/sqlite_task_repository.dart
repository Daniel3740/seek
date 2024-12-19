import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart';

class SqliteTaskRepository implements TaskRepository {
  late Database _database;

  Future<void> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String pathDB = join(databasesPath, 'tasks.db');
    _database = await openDatabase(
      pathDB,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id TEXT PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await _database.query('tasks');
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  @override
  Future<Task> getTaskById(String id) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    print(maps);
    return Task(
      id: maps[0]['id'],
      title: maps[0]['title'],
      description: maps[0]['description'],
      isCompleted: maps[0]['isCompleted'] == 1,
    );
  }

  @override
  Future<void> createTask(Task task) async {
    await _database.insert(
      'tasks',
      {
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'isCompleted': task.isCompleted ? 1 : 0,
      },
    );
  }

  @override
  Future<void> deleteTask(String id) async {
    await _database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Database get database {
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    return _database;
  }

  @override
  Future<void> updateTask(Task task) async {
    await _database.update(
      'tasks',
      {
        'title': task.title,
        'description': task.description,
        'isCompleted': task.isCompleted ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
