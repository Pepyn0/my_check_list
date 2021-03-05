import 'package:my_check_list/app/data/sqlite/connection.dart';
import 'package:my_check_list/app/domain/entities/task.dart';
import 'package:my_check_list/app/domain/interfaces/task_dao.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAOImpl implements TaskDAO{
	Database _db;

	@override
	Future<List<Task>> find() async {
		_db = await Connection.get();
		List<Map<String, dynamic>> resultado = await _db.query('tasks');

		List<Task> lista = List.generate(resultado.length, (i) {
			var linha = resultado[i];
			//print(linha);
			return Task(
				id: linha['id'],
				task: linha['tarefa'],
        description: linha['descricao'],
				important: linha['importante'] == 1 ? true : false,
        completed: linha['completa'] == 1 ? true : false,
			);
		});
		return lista;
	}

	@override
	void remove(int id) async {
		_db = await Connection.get();
		var sql = '''
		DELETE FROM tasks
		WHERE id = ?
		''';
		_db.rawDelete(sql, [id]);
	}
	
	@override
	void save(Task task) async {
		_db = await Connection.get();
		if(task.id == null) {
      print(task);

			var sql = '''
			INSERT INTO tasks(tarefa, descricao, importante, completa)
			VALUES(?, ?, ?, ?)
			''';
			_db.rawInsert(
        sql,
        [
        task.task,
        task.description,
        task.important == true ? 1 : 0,
        task.completed == true ? 1 : 0,
        ]);
		} else {

			var sql = '''
			UPDATE tasks SET tarefa = ?, descricao = ?, importante = ?, completa = ?
			WHERE id = ?
			''';
			_db.rawUpdate(
        sql,
        [
        task.task,
        task.description,
        task.important == true ? 1 : 0,
        task.completed == true ? 1 : 0,
        task.id
        ]);
		}
	}
}
