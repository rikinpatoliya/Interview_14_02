import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/firebase_options.dart';
import 'package:rikin_interview_14_02/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}
