import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:seek_prueba_tecnica/application/providers/task_provider.dart';
import 'package:seek_prueba_tecnica/presentation/pages/task_list_page.dart';
import '../../infrastructure/adapters/mock_task_repository.dart';

void main() {
  late TaskProvider taskProvider;
  late MockTaskRepositoryCustom mockRepository;

  setUp(() {
    mockRepository = MockTaskRepositoryCustom();
    taskProvider = TaskProvider(mockRepository);
  });

  testWidgets('debería mostrar la lista de tareas',
      (WidgetTester tester) async {
    await taskProvider.addTask('Test Task', 'Test Descripcion');

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: taskProvider,
          child: TaskListPage(),
        ),
      ),
    );

    expect(find.text('Test Task'), findsOneWidget);
    expect(find.text('Test Descripcion'), findsOneWidget);
  });

  testWidgets('debería alternar la finalización de la tarea',
      (WidgetTester tester) async {
    await taskProvider.addTask('Test Task', 'Test Descripcion');

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: taskProvider,
          child: TaskListPage(),
        ),
      ),
    );

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(taskProvider.tasks.first.isCompleted, true);
  });

  testWidgets('should delete task', (WidgetTester tester) async {
    await taskProvider.addTask('Test Task', 'Test Descripcion');

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: taskProvider,
          child: TaskListPage(),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text('Test Task'), findsNothing);
  });
}
