import 'package:auto_route/auto_route.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_page.dart';
import 'package:rikin_interview_14_02/presentation/user/login/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    //User
    AutoRoute(
        page: LoginRoute.page, path: RoutesNames.loginPage, initial: true),
    AutoRoute(page: DashboardRoute.page, path: RoutesNames.dashboardPage),
  ];
}

abstract class RoutesNames {
  // USER
  static const loginPage = '/loginPage';
  static const dashboardPage = '/dashboardPage';
}
