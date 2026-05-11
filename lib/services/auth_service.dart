import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //password reset and other auth related methods
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      throw Exception(_handleAuthError(e.toString()));
    }
  }
  //Biometric/fingerprint logic can be implemented here using local_auth package

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw Exception(_handleAuthError(e.toString()));
    }
  }

  Future<User?> register(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        // Create user document in Firestore as per blueprint
        await _db.collection('users').doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'phone': phone,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      return credential.user;
    } catch (e) {
      throw Exception(_handleAuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String _handleAuthError(String error) {
    if (error.contains('user-not-found')) {
      return 'No user found for that email.';
    }
    if (error.contains('wrong-password')) {
      return 'Wrong password provided.';
    }
    if (error.contains('email-already-in-use')) {
      return 'Account with this email has already exists.';
    }
    return 'this account does not exist!'; //'Authentication failed. Please try again.';
  }
}
