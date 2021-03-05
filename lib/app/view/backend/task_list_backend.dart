

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_check_list/app/domain/entities/task.dart';
import 'package:my_check_list/app/domain/services/task_service.dart';
import 'package:my_check_list/app/my_app.dart';

part 'task_list_backend.g.dart';

class TaskListBackend = _TaskListBackend with _$TaskListBackend;

//flutter packages pub run build_runner build

abstract class _TaskListBackend with Store {
	var _service = GetIt.I.get<TaskService>();

	//lista de tarefas
	@observable
	Future<List<Task>> listTask;

	@action
	void refreshList([dynamic value]) {
		listTask = _service.find();
	}

	_TaskListBackend() {
		refreshList();// Atualiza a lista quando o contrutor for inicializado 
	}

	//Excluir
	void remove(int id){
		_service.delete(id);
		refreshList();
	}

	//método para chamar o formulário salvar/alterar
	void goToForm(BuildContext context, [Task task]) {
		Navigator.of(context).pushNamed(MyApp.TASK_ADD, arguments: task).then(refreshList);
	}

	//método de atualizar
	void save(Task task){
		_service.save(task);
		refreshList();
	}
}
