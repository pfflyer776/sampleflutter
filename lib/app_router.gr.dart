// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreditDashboardPage]
class CreditDashboardRoute extends PageRouteInfo<CreditDashboardRouteArgs> {
  CreditDashboardRoute({
    required bool shouldShowDialog,
    List<PageRouteInfo>? children,
  }) : super(
         CreditDashboardRoute.name,
         args: CreditDashboardRouteArgs(shouldShowDialog: shouldShowDialog),
         initialChildren: children,
       );

  static const String name = 'CreditDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreditDashboardRouteArgs>();
      return CreditDashboardPage(shouldShowDialog: args.shouldShowDialog);
    },
  );
}

class CreditDashboardRouteArgs {
  const CreditDashboardRouteArgs({required this.shouldShowDialog});

  final bool shouldShowDialog;

  @override
  String toString() {
    return 'CreditDashboardRouteArgs{shouldShowDialog: $shouldShowDialog}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreditDashboardRouteArgs) return false;
    return shouldShowDialog == other.shouldShowDialog;
  }

  @override
  int get hashCode => shouldShowDialog.hashCode;
}

/// generated route for
/// [EmploymentFormPage]
class EmploymentFormRoute extends PageRouteInfo<void> {
  const EmploymentFormRoute({List<PageRouteInfo>? children})
    : super(EmploymentFormRoute.name, initialChildren: children);

  static const String name = 'EmploymentFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return EmploymentFormPage();
    },
  );
}

/// generated route for
/// [MyNavigatorPage]
class MyNavigatorRoute extends PageRouteInfo<void> {
  const MyNavigatorRoute({List<PageRouteInfo>? children})
    : super(MyNavigatorRoute.name, initialChildren: children);

  static const String name = 'MyNavigatorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return MyNavigatorPage();
    },
  );
}
