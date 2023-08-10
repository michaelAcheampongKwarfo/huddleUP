// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:huddle_up_project/widgets/app_snackbar.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  User get user => _auth.currentUser!;
  Stream<User?> get authChanges => _auth.authStateChanges();

  // Sign in with Google and store user details in Firestore
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the Google Sign-In
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the Google ID token and access token
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Get the user details
        final User? user = userCredential.user;

        if (user != null) {
          // Store user details in Firestore
          await _usersCollection.doc(user.uid).set({
            'uid': user.uid,
            'email': user.email,
            'displayName': user.displayName,
            'photoURL': user.photoURL,
            // Add additional user details as needed
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      AppSnackBar.showSnackBar(
        context,
        message: e.message.toString(),
      );
    } catch (e) {
      AppSnackBar.showSnackBar(
        context,
        message: e.toString(),
      );
    }
  }

  // sign out the current user
  Future<void> signOut(BuildContext context) async {
    try {
      // sign out from firebase authentication
      await _auth.signOut();
      // sign out form google sign in
      await _googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      AppSnackBar.showSnackBar(
        context,
        message: e.message.toString(),
      );
    } catch (e) {
      AppSnackBar.showSnackBar(
        context,
        message: e.toString(),
      );
    }
  }
}
