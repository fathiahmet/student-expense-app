// // import 'package: student_expense_app/services/cloud_firestore/cloud_firestore.dart';
// import 'package: firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:student_expense_app/services/firestore_service.dart';
// import '../models/expense_model.dart';
// import '../models/income_model.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //Registrtion
//   Future<User?> registerWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return result.user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   //Sign in
//   Future<User?> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return result.user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   //Sign out
//   Future<void> signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return;
//     }
//   }
// }
