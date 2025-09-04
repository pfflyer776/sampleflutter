import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banktest/models/employment_model.dart';
import 'package:banktest/view_models/employment_view_model.dart';

final employmentVmProvider =
AsyncNotifierProvider<EmploymentViewModel, Employment>(() => EmploymentViewModel());
