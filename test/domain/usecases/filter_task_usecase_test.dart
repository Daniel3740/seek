import 'package:flutter_test/flutter_test.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/usecases/filter_tasks_usecase.dart';

void main() {
  late FilterTasksUseCase filterTasksUseCase;
  late List<Task> testTasks;

  setUp(() {
    filterTasksUseCase = FilterTasksUseCase();
    testTasks = [
      Task(
          id: '1',
          title: 'Task 1',
          description: 'Description 1',
          isCompleted: false),
      Task(
          id: '2',
          title: 'Task 2',
          description: 'Description 2',
          isCompleted: true),
      Task(
          id: '3',
          title: 'Different',
          description: 'Other desc',
          isCompleted: false),
    ];
  });

  group('FilterTasksUseCase', () {
    test('should filter completed tasks', () {
      final result = filterTasksUseCase.execute(testTasks, isCompleted: true);
      expect(result.length, 1);
      expect(result.first.id, '2');
    });

    test('should filter incomplete tasks', () {
      final result = filterTasksUseCase.execute(testTasks, isCompleted: false);
      expect(result.length, 2);
      expect(result.map((e) => e.id).toList(), ['1', '3']);
    });

    test('should filter by search query in title', () {
      final result = filterTasksUseCase.execute(testTasks, searchQuery: 'Task');
      expect(result.length, 2);
      expect(result.map((e) => e.id).toList(), ['1', '2']);
    });

    test('should filter by search query in description', () {
      final result =
          filterTasksUseCase.execute(testTasks, searchQuery: 'Other');
      expect(result.length, 1);
      expect(result.first.id, '3');
    });

    test('should combine filters', () {
      final result = filterTasksUseCase.execute(
        testTasks,
        isCompleted: false,
        searchQuery: 'Task',
      );
      expect(result.length, 1);
      expect(result.first.id, '1');
    });
  });
}
