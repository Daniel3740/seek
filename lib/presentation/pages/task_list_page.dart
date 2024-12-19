import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seek_prueba_tecnica/application/providers/task_provider.dart';
import 'package:seek_prueba_tecnica/presentation/pages/create_task_page.dart';
import 'package:seek_prueba_tecnica/presentation/widgets/task_filter.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
      ),
      body: Column(
        children: [
          TaskFilter(),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                final filteredTasks = taskProvider.tasks;

                if (filteredTasks.isEmpty) {
                  if (taskProvider.searchQuery.isNotEmpty) {
                    return const Center(
                      child: Text(
                          'No se encontraron tareas que coincidan con la búsqueda'),
                    );
                  }
                  if (taskProvider.filterCompleted != null) {
                    return Center(
                      child: Text(
                        taskProvider.filterCompleted!
                            ? 'No hay tareas completadas'
                            : 'No hay tareas pendientes',
                      ),
                    );
                  }
                  return const Center(
                    child: Text('No hay tareas'),
                  );
                }

                return ListView.builder(
                  itemCount: filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle: Text(task.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: task.isCompleted,
                              onChanged: (bool? value) {
                                taskProvider.toggleTaskStatus(task);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                taskProvider.deleteTask(task.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
