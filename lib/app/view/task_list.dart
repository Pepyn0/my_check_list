import 'package:flutter/material.dart';
import 'package:my_check_list/app/my_app.dart';

class TaskList extends StatelessWidget {

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
		);
	}

}