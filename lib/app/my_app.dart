import 'package:flutter/material.dart';
import 'package:my_check_list/app/view/task_add.dart';
import 'package:my_check_list/app/view/task_list.dart';

class MyApp extends StatelessWidget {
	static const HOME = '/';
	static const TASK_ADD = 'task-add';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.deepPurple,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			routes: {
				HOME: (context) => TaskList(),
				TASK_ADD: (context) => TaskAdd(),
			},
		);
	}
}
