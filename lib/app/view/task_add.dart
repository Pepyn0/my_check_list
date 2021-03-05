import 'package:flutter/material.dart';
import 'package:my_check_list/app/data/sqlite/dao/task_dao_impl.dart';
import 'package:my_check_list/app/domain/entities/task.dart';

class TaskAdd extends StatelessWidget {
	final _form = GlobalKey<FormState>();

	FlatButton saveButton(BuildContext context, Task task) {

		return FlatButton(
			child: Text('Salvar'),
			onPressed: () {
				_form.currentState.save();
				if(task.task.isNotEmpty) {
					TaskDAOImpl().save(task);
					
				}
				Navigator.of(context).pop();
			},
		);
	}

	FlatButton cancelButton(BuildContext context) {
		return FlatButton(
			child: Text('Cancelar'),
			onPressed: () => Navigator.of(context).pop(),
		);
	}

	@override
	Widget build(BuildContext context) {
		var _task = Task();
		return AlertDialog(
			title: Text('Tarefa'),
			content: Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisSize: MainAxisSize.min,
				children: [
					Form(
						key: _form,
						child: Column(
							children: [
								TextFormField(
									onSaved: (newValue) => _task.task = newValue,
									decoration: InputDecoration(labelText: 'Tarefa...'),
								),
								TextFormField(
									onSaved: (newValue) => _task.description = newValue,
									decoration: InputDecoration(labelText: 'Descrição...'),
								),
								CheckboxListTile(
									value: _task.important,
									title: Text('Prioridade'),
									contentPadding: EdgeInsets.zero,
									controlAffinity: ListTileControlAffinity.leading,
									onChanged: (value) => _task.important = value,
								),
							],
						),
					),
				],
			),
			actions: [
				cancelButton(context),
				saveButton(context, _task),
			],
		);
	}
}
