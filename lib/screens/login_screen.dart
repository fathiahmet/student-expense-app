// import 'package:flutter/material.dart';

// void main() {
//   runApp(const EduPayApp());
// }

// class EduPayApp extends StatelessWidget {
//   const EduPayApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const LoginScreen(),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//   @override
//   State<LoginScreen> createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   bool isObscured = true;
//   @override
//   Widget build(BuildContext context) {
//     const Color primaryBlue = Color(0xFF3D4FA3);
//     return Scaffold(
//       backgroundColor: primaryBlue,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const Text(
//               "EduPay",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Empowering Student Future",
//               style: TextStyle(color: Colors.white70, fontSize: 14),
//             ),
//             const SizedBox(height: 40),
//             const Text(
//               "Welcome Back!",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 40),
//             //Bottom Container card
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                   vertical: 30,
//                 ),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Sign in",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     //Email fild
//                     _buildInputField(
//                       icon: Icons.email, hint: "Email"),
//                     const SizedBox(height: 20),
//                     //password field
//                     _buildInputField(
//                       icon: Icons.lock,
//                       hint: "password",
//                       isPassword: true,
//                     ),
//                     const SizedBox(height: 30),
//                     //sign in button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryBlue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           "sign in",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     const Text(
//                       "Forgot password",
//                       style: TextStyle(color: Colors.black54),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text("Don't have an account ? "),
//                         Text(
//                           "SIGN UP",
//                           style: TextStyle(
//                             color: primaryBlue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   //input field widget
//   Widget _buildInputField({
//     required IconData Icon,
//     required String hint,
//     bool isPassword = false,
//   }) {
//     return TextField(
//       obscureText: isPassword ? isObscured : false,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, Color: Colors.black),
//         hintText: hint,
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 icon: Icon(
//                   isObscured ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isObscured = !isObscured;
//                   });
//                 },
//               )
//             : null,
//       ),
//     );
//   }
// }
