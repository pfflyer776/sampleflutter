// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../services/employment_service.dart';
// import '../models/employment_model.dart';
// import '../view_models/employment_view_model.dart';
//
// final employmentLoaderProvider = FutureProvider<EmploymentData>((ref) async {
//   final service = EmploymentService();
//   final data = await service.loadFromJson();
//   ref.read(employmentViewModelProvider.notifier).update(data);
//   return data;
// });
