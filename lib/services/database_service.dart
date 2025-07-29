import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class DatabaseService {
  static const _dbName = 'app.db';
  static const _storeName = 'employment';

  late final Database _db;
  final _store = intMapStoreFactory.store(_storeName);

  Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocDir.path, _dbName);
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> saveEmployment(Map<String, dynamic> data) async {
    await _store.record(1).put(_db, data); // Fixed key since it's a single record
  }

  Future<Map<String, dynamic>?> loadEmployment() async {
    return await _store.record(1).get(_db);
  }

  Database get database => _db;
}
