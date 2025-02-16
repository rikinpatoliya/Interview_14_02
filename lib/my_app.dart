import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';

class MainApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
