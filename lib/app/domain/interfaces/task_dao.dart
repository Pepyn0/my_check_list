
import 'package:my_check_list/app/domain/entities/task.dart';

abstract class TaskDAO{

	void save(Task task);

	void remove(int id);

	Future<List<Task>> find();

}
