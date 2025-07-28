import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:avatest/creditdashboardapp.dart';

void main() {
  runApp(
      ProviderScope(
          child: CreditDashboardApp()
      )
  );
}