import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/core/utils/share_prefs.dart';
import 'package:rikin_interview_14_02/presentation/cart_detail/cart_detail_page.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_page.dart';
import 'package:rikin_interview_14_02/presentation/product_detail/product_detail_page.dart';
import 'package:rikin_interview_14_02/presentation/user/login/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    //User
    if (sharedPrefs.isLoggedIn) ...[
      AutoRoute(
        page: LoginRoute.page,
        path: RoutesNames.loginPage,
      ),
      AutoRoute(
          page: DashboardRoute.page,
          path: RoutesNames.dashboardPage,
          initial: true),
    ] else ...[
      AutoRoute(
        page: LoginRoute.page,
        path: RoutesNames.loginPage,
        initial: true,
      ),
      AutoRoute(
        page: DashboardRoute.page,
        path: RoutesNames.dashboardPage,
      ),
    ],

    AutoRoute(
      page: ProductDetailRoute.page,
      path: RoutesNames.productDetailPage,
    ),

    AutoRoute(
      page: CartDetailRoute.page,
      path: RoutesNames.cartDetailPage,
    ),
  ];
}

abstract class RoutesNames {
  // USER
  static const loginPage = '/loginPage';
  static const dashboardPage = '/dashboardPage';
  static const productDetailPage = '/productDetailPage';
  static const cartDetailPage = '/cartDetailPage';
}
