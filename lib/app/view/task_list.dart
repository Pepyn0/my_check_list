import 'package:flutter/material.dart';
import 'package:my_check_list/app/data/sqlite/dao/task_dao_impl.dart';
import 'package:my_check_list/app/domain/entities/task.dart';
import 'package:my_check_list/app/my_app.dart';

class TaskList extends StatelessWidget {

	Future<List<Task>> _buscar() async {
		return TaskDAOImpl().find();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('MycheckList'),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.of(context).pushNamed(MyApp.TASK_ADD);
				},
				tooltip: 'Salvar',
				child: Icon(Icons.add),
			),

			body: FutureBuilder(
				future: _buscar(),
				builder: (context, futuro) {
					if(!futuro.hasData) {
						return Center(
							child: CircularProgressIndicator(),
						);
					} else {
						List<Task> lista = futuro.data;
						return ListView.builder(
							itemCount: lista.length,
							itemBuilder: (context, i) {
								var task = lista[i];
								return Card(
									child: CheckboxListTile(
										title: Text(task.task),
										subtitle: Text(task.description),
										value: task.completed,
										controlAffinity: ListTileControlAffinity.leading,
										onChanged: (value) {
											task.completed = value;
											//TaskDAOImpl().save(task);
										},
										secondary: Container(
											child: IconButton(icon: Icon(Icons.edit), onPressed: () {})
										),
									),
								);
							},
						);
					}
				},
			),
		);
	}

}
