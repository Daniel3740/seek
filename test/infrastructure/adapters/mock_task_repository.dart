import 'package:mockito/annotations.dart';
import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart';

// Implementación del mock manual para que puedas usarlo en tus pruebas
class MockTaskRepositoryCustom implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<List<Task>> getAllTasks() async {
    return _tasks;
  }

  @override
  Future<Task> getTaskById(String id) async {
    return _tasks.firstWhere((task) => task.id == id);
  }

  @override
  Future<void> createTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
  }
}

@GenerateMocks([TaskRepository])
void main() {}
