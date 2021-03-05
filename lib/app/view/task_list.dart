import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_check_list/app/domain/entities/task.dart';
import 'package:my_check_list/app/my_app.dart';
import 'package:my_check_list/app/view/backend/task_list_backend.dart';

class TaskList extends StatelessWidget {

	final _backend = TaskListBackend();

	IconButton _editButton(Function onPressedFunc) {
		return IconButton(
			color: Colors.deepPurple,
			icon: Icon(Icons.edit),
			onPressed: onPressedFunc,
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('MyCheckList'),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.of(context).pushNamed(MyApp.TASK_ADD);
				},
				tooltip: 'Salvar',
				child: Icon(Icons.add),
			),

			body: Observer(builder: (context) {
				return FutureBuilder(
					future: _backend.listTask,
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
												_backend.save(task);
											},
											secondary: Container(
												child: _editButton(() {
													_backend.goToForm(context, task);
												}),
											),
										),
									);
								},
							);
						}
					},
				);
			})
		);
	}
}
