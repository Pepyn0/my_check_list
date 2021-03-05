import 'package:get_it/get_it.dart';
import 'package:my_check_list/app/data/sqlite/dao/task_dao_impl.dart';
import 'package:my_check_list/app/domain/interfaces/task_dao.dart';
import 'package:my_check_list/app/domain/services/task_service.dart';

void setupInjection() {
	GetIt getIt = GetIt.I;

	getIt.registerSingleton<TaskDAO>(TaskDAOImpl());
	getIt.registerSingleton<TaskService>(TaskService());
}