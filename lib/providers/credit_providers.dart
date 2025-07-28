import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/credit_service.dart';
import '../view_models/credit_profile_view_model.dart';
import '../models/credit_profile.dart';

final creditServiceProvider = Provider((ref) => CreditService());

final creditProfileProvider =
StateNotifierProvider<CreditProfileViewModel, AsyncValue<CreditProfile>>(
      (ref) {
    final service = ref.read(creditServiceProvider);
    return CreditProfileViewModel(service);
  },
);
