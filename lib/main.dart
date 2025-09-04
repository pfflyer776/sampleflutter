import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banktest/creditdashboardapp.dart';
import 'package:banktest/data/employment_repository.dart';
import 'package:path_provider/path_provider.dart';

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