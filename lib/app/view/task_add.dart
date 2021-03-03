import 'package:flutter/material.dart';

class TaskAdd extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Adicionar tarefa'),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: null,
				tooltip: 'Salvar',
				child: Icon(Icons.save),
			),

		);
	}

}