import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avatest/creditdashboardapp.dart';
import 'package:avatest/data/employment_repository.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  final dbService = container.read(dbProvider);
  await dbService.init();

  runApp(
      UncontrolledProviderScope(
          container: container,
          child: CreditDashboardApp()
      )
  );
}