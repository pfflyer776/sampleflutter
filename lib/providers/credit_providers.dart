import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avatest/services/credit_service.dart';
import 'package:avatest/view_models/credit_profile_view_model.dart';
import 'package:avatest/models/credit_profile.dart';

final creditServiceProvider = Provider((ref) => CreditService());

final creditProfileProvider =
StateNotifierProvider<CreditProfileViewModel, AsyncValue<CreditProfile>>(
      (ref) {
    final service = ref.read(creditServiceProvider);
    return CreditProfileViewModel(service);
  },
);
