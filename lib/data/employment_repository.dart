import 'package:flutter/services.dart' show rootBundle;
import 'package:sembast/sembast.dart';
import 'package:riverpod/riverpod.dart';
import 'dart:convert';
import 'package:banktest/models/employment_model.dart';
import 'package:banktest/services/database_service.dart';

final dbProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});
final employmentRepoProvider = Provider<EmploymentRepository>((ref) {
  final db = ref.read(dbProvider);
  return EmploymentRepository(db.database);
});

class EmploymentRepository {
  static const storeName = 'employment';
  final Database _db;
  final _store = intMapStoreFactory.store(storeName);

  EmploymentRepository(this._db);

  Future<Employment> loadFromJsonAsset() async {
    final raw = await rootBundle.loadString('assets/employment.json');
    final json = jsonDecode(raw);
    return Employment.fromJson(json);
  }

  Future<Employment> loadFromDb() async {
    final rec = await _store.findFirst(_db);
    if (rec == null) return loadFromJsonAsset();
    return Employment.fromJson(rec.value);
  }

  Future<void> save(Employment e) async {
    await _store.delete(_db);
    await _store.add(_db, e.toJson());
  }
}
