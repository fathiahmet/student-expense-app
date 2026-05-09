// import 'dart:async';
// import 'package: flutter/material.dart';
// import 'package: student_expense_app/screens/register_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const RegisterScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome to EduPay',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             Image.asset('assets/images/splash.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }
