// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_backend.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskListBackend on _TaskListBackend, Store {
  final _$listTaskAtom = Atom(name: '_TaskListBackend.listTask');

  @override
  Future<List<Task>> get listTask {
    _$listTaskAtom.reportRead();
    return super.listTask;
  }

  @override
  set listTask(Future<List<Task>> value) {
    _$listTaskAtom.reportWrite(value, super.listTask, () {
      super.listTask = value;
    });
  }

  final _$_TaskListBackendActionController =
      ActionController(name: '_TaskListBackend');

  @override
  void refreshList([dynamic value]) {
    final _$actionInfo = _$_TaskListBackendActionController.startAction(
        name: '_TaskListBackend.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_TaskListBackendActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTask: ${listTask}
    ''';
  }
}
