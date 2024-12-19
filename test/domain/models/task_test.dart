import 'package:flutter_test/flutter_test.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';

void main() {
  group('Task Model', () {
    test('should create Task instance with required values', () {
      final task = Task(
        id: '1',
        title: 'Test Task',
        description: 'Test Description',
      );

      expect(task.id, '1');
      expect(task.title, 'Test Task');
      expect(task.description, 'Test Description');
      expect(task.isCompleted, false);
    });

    test('copyWith should return new instance with updated values', () {
      final task = Task(
        id: '1',
        title: 'Test Task',
        description: 'Test Description',
        isCompleted: false,
      );

      final updatedTask = task.copyWith(
        title: 'Updated Task',
        isCompleted: true,
      );

      expect(updatedTask.id, task.id);
      expect(updatedTask.title, 'Updated Task');
      expect(updatedTask.description, task.description);
      expect(updatedTask.isCompleted, true);
    });
  });
}
