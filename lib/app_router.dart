import 'package:auto_route/auto_route.dart';
import 'package:banktest/creditdashboardapp.dart';
import 'package:banktest/views/confirm/employmentformpage.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyNavigatorRoute.page, initial: true),
    AutoRoute(page: CreditDashboardRoute.page),
    AutoRoute(page: EmploymentFormRoute.page)
  ];
}