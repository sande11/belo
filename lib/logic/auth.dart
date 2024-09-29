import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Create User
  Future<User?> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credentials.user?.updateDisplayName(name); // Update display name
      return credentials.user;
    } catch (e) {
      log("Something went wrong: $e"); // Log the error
    }
    return null;
  }

  // Log In
  Future<User?> logUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials.user;
    } catch (e) {
      log("Something went wrong: $e"); // Log the error
    }
    return null;
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Sign out failed: $e");
    }
  }
}
