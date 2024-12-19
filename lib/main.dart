// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seek_prueba_tecnica/application/providers/task_provider.dart';
import 'package:seek_prueba_tecnica/infraestructure/adapters/sqlite_task_repository.dart';
import 'package:seek_prueba_tecnica/presentation/pages/task_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final taskRepository = SqliteTaskRepository();
  await taskRepository.initDatabase();

  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(taskRepository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(),
    );
  }
}
