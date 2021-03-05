import 'package:get_it/get_it.dart';
import 'package:my_check_list/app/domain/entities/task.dart';
import 'package:my_check_list/app/domain/exception/domain_layer_exception.dart';
import 'package:my_check_list/app/domain/interfaces/task_dao.dart';

class TaskService{
	var _dao = GetIt.I.get<TaskDAO>();

	// tem que salvar uma tarefa, ter a possibilidade de alterar e excluir e listar todas as tarefas
	void save(Task task) {
		validateName(task.task);
		_dao.save(task);
	}

	void delete(int id) {
		_dao.remove(id);
	}

	Future<List<Task>> find() {
		return _dao.find();
	}

	// nome → seja obrigatório, tenha no mínimo 1 caracteres e no máximo 50
	void validateName(String task) {
		var max = 50;
		var min = 1;

		if(task == null) {
			throw DomainLayerException('O nome da taréfa é obrigatório.');
		} else if(task.length > max) {
			throw DomainLayerException('O nome deve possuir pelo menos $max caracteres.');
		} else if(task.length < min) {
			throw DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
		}
	}
}
