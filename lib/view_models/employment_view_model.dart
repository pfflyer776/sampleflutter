import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avatest/data/employment_repository.dart';
import 'package:avatest/models/employment_model.dart';

class EmploymentViewModel extends AsyncNotifier<Employment> {
  late final EmploymentRepository _repo;

  @override
  Future<Employment> build() async {
    _repo = ref.read(employmentRepoProvider);
    return _repo.loadFromDb();
  }

  Future<void> updateEmployment(Employment updated) async {
    state = const AsyncValue.loading();
    try {
      await _repo.save(updated);
      state = AsyncValue.data(updated);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
