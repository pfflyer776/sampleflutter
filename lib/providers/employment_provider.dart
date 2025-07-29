import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avatest/models/employment_model.dart';
import 'package:avatest/view_models/employment_view_model.dart';

final employmentVmProvider =
AsyncNotifierProvider<EmploymentViewModel, Employment>(() => EmploymentViewModel());
