// Mocks generated by Mockito 5.4.5 from annotations
// in seek_prueba_tecnica/test/domain/usecases/create_task_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:seek_prueba_tecnica/domain/models/task.dart' as _i2;
import 'package:seek_prueba_tecnica/domain/ports/task_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTask_0 extends _i1.SmartFake implements _i2.Task {
  _FakeTask_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i3.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.Task>> getAllTasks() =>
      (super.noSuchMethod(
            Invocation.method(#getAllTasks, []),
            returnValue: _i4.Future<List<_i2.Task>>.value(<_i2.Task>[]),
          )
          as _i4.Future<List<_i2.Task>>);

  @override
  _i4.Future<_i2.Task> getTaskById(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#getTaskById, [id]),
            returnValue: _i4.Future<_i2.Task>.value(
              _FakeTask_0(this, Invocation.method(#getTaskById, [id])),
            ),
          )
          as _i4.Future<_i2.Task>);

  @override
  _i4.Future<void> createTask(_i2.Task? task) =>
      (super.noSuchMethod(
            Invocation.method(#createTask, [task]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> updateTask(_i2.Task? task) =>
      (super.noSuchMethod(
            Invocation.method(#updateTask, [task]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> deleteTask(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#deleteTask, [id]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}