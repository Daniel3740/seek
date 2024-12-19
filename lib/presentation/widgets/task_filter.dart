import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/task_provider.dart';

class TaskFilter extends StatelessWidget {
  const TaskFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Barra de búsqueda
          TextField(
            decoration: InputDecoration(
              hintText: 'Buscar tareas...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) => provider.setSearchQuery(value),
          ),
          const SizedBox(height: 16),
          // Filtros de estado
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Todas'),
                  selected: provider.filterCompleted == null,
                  onSelected: (selected) {
                    if (selected) provider.setFilter(null);
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Pendientes'),
                  selected: provider.filterCompleted == false,
                  onSelected: (selected) {
                    provider.setFilter(selected ? false : null);
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Completadas'),
                  selected: provider.filterCompleted == true,
                  onSelected: (selected) {
                    provider.setFilter(selected ? true : null);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
