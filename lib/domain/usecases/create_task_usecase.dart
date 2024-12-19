import 'package:uuid/uuid.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart';

class CreateTaskUseCase {
  final TaskRepository _repository;
  final Uuid _uuid;

  CreateTaskUseCase(this._repository) : _uuid = Uuid();

  Future<void> execute(String title, String description) async {
    final task = Task(
      id: _uuid.v4(), // Genera un UUID único.
      title: title,
      description: description,
      isCompleted: false,
    );
    await _repository.createTask(task);
  }
}
