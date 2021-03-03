import 'package:flutter/material.dart';
import 'package:my_check_list/app/view/my_home_page.dart';

class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.deepPurple,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}