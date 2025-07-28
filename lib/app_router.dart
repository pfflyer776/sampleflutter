import 'package:auto_route/auto_route.dart';
import 'creditdashboardapp.dart';
import 'views/confirm/employmentformpage.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CreditDashboardRoute.page, initial: true),
    AutoRoute(page: EmploymentFormRoute.page)
  ];
}