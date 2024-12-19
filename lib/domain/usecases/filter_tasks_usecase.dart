import 'package:seek_prueba_tecnica/domain/models/task.dart';

class FilterTasksUseCase {
  List<Task> execute(List<Task> tasks,
      {bool? isCompleted, String? searchQuery}) {
    return tasks.where((task) {
      // Filtrar por estado de completado
      if (isCompleted != null && task.isCompleted != isCompleted) {
        return false;
      }

      // Filtrar por búsqueda en título o descripción
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        return task.title.toLowerCase().contains(query) ||
            task.description.toLowerCase().contains(query);
      }

      return true;
    }).toList();
  }
}
