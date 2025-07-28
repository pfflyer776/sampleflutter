import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/credit_profile.dart';
import '../services/credit_service.dart';

class CreditProfileViewModel extends StateNotifier<AsyncValue<CreditProfile>> {
  final CreditService _service;

  CreditProfileViewModel(this._service) : super(const AsyncValue.loading()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _service.fetchCreditProfile());
  }

  void refresh() => loadProfile();
}
