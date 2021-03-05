import 'package:flutter/material.dart';
import 'package:my_check_list/app/injection.dart';

import 'app/my_app.dart';

void main() {
	setupInjection();
	runApp(MyApp());
}
