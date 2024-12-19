import 'package:flutter/foundation.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart';
import 'package:seek_prueba_tecnica/domain/usecases/create_task_usecase.dart';
import 'package:seek_prueba_tecnica/domain/usecases/filter_tasks_usecase.dart';

class TaskProvider with ChangeNotifier {
  final TaskRepository _repository;
  final CreateTaskUseCase _createTaskUseCase;
  final FilterTasksUseCase _filterTasksUseCase;

  List<Task> _tasks = [];
  bool? _filterCompleted;
  String _searchQuery = '';

  TaskProvider(this._repository)
      : _createTaskUseCase = CreateTaskUseCase(_repository),
        _filterTasksUseCase = FilterTasksUseCase() {
    _loadTasks();
  }

  List<Task> get tasks => _filterTasksUseCase.execute(
        _tasks,
        isCompleted: _filterCompleted,
        searchQuery: _searchQuery,
      );

  bool? get filterCompleted => _filterCompleted;
  String get searchQuery => _searchQuery;

  void setFilter(bool? isCompleted) {
    _filterCompleted = isCompleted;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> _loadTasks() async {
    _tasks = await _repository.getAllTasks();
    notifyListeners();
  }

  Future<void> loadTasksForTesting() async {
    await _loadTasks();
  }

  Future<void> addTask(String title, String description) async {
    await _createTaskUseCase.execute(title, description);
    await _loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _repository.updateTask(task);
    await _loadTasks();
  }

  Future<void> toggleTaskStatus(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await _repository.updateTask(updatedTask);
    await _loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
    await _loadTasks();
  }
}
