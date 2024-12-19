import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:seek_prueba_tecnica/domain/models/task.dart';
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart';
import 'package:seek_prueba_tecnica/domain/usecases/create_task_usecase.dart';
import 'package:uuid/uuid.dart';

import '../../infrastructure/adapters/mock_task_repository.dart';

@GenerateMocks([TaskRepository])
void main() {
  late CreateTaskUseCase createTaskUseCase;
  late MockTaskRepositoryCustom mockRepository;

  setUp(() {
    mockRepository = MockTaskRepositoryCustom();
    createTaskUseCase = CreateTaskUseCase(mockRepository);
  });

  test('debe crear una tarea con los valores correctos', () async* {
    Uuid uuid = Uuid();
    String id = uuid.v4();
    // Arrange
    final task =
        Task(id: id, title: 'Test Title', description: 'Test Description');
    when(mockRepository.createTask(task)).thenAnswer((_) async {});

    // Act
    await createTaskUseCase.execute('Test Title', 'Test Description');

    // Assert
    verify(mockRepository.createTask(task)).called(1);
    final captured =
        verify(mockRepository.createTask(task)).captured.single as Task;

    // Validar los valores
    expect(captured.title, 'Test Title');
    expect(captured.description, 'Test Description');
    expect(captured.isCompleted, false);
  });
}
