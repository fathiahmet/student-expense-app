import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_expense_app/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  //Ensure flutter is ready before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase with platform-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
