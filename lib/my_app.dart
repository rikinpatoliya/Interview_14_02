import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => getIt(),
      child: MaterialApp.router(
        title: 'My App',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
