import 'package:my_check_list/app/data/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{
	static Database _db;

	static Future<Database> get() async {
		if(_db == null) {
			var path = join(await getDatabasesPath(), 'database.db');

			//deleteDatabase(path);
			_db = await openDatabase(
				path,
				version: 1,
				onCreate: (db, v) {
					print('criando Banco de Dados!');
					db.execute(createTable);
					db.execute(testeInsert);
				}
			);
		}

		return _db;
	}
}
