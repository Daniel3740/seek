import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/infraestructure/adapters/sqlite_task_repository.dart';

@GenerateMocks([Database])
void main() {
  late SqliteTaskRepository repository;
  late String id;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    repository = SqliteTaskRepository();
    await repository.initDatabase();
    id = Uuid().v4();
  });

  tearDown(() async {
    await repository.database.close();
  });

  group('SqliteTaskRepository', () {
    test('debe crear y recuperar la tarea', () async {
      // Arrange
      final task = Task(
        id: id,
        title: 'Test Task',
        description: 'Test Description',
      );

      // Act
      await repository.createTask(task);
      final retrievedTask = await repository.getTaskById(id);

      // Assert
      expect(retrievedTask.id, task.id);
      expect(retrievedTask.title, task.title);
      expect(retrievedTask.description, task.description);
    });

    test('debería eliminar la tarea', () async* {
      // Arrange
      final task = Task(
        id: id,
        title: 'Task to be deleted',
        description: 'Test Description',
      );
      await repository.createTask(task).then(
        (value) async {
          Task task = await repository.getTaskById(id);
          print('${task.id} Id de la tarea');
        },
      );

      // Act
      await repository.deleteTask(id).then(
        (value) async {
          Task task = await repository.getTaskById(id);
          print('${task.id} Id de la tarea borrada');
        },
      ).catchError((error) {
        print('${error.toString()} este es el error');
      });

      // Assert
      expect(
        () => repository.getTaskById(id),
        throwsA(isA<Exception>().having(
            (e) => e.toString(), 'message', contains('Task not found'))),
      );
    });
  });
}
