// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hiyo/models/user.dart';

// class AuthService with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user object based on firebase user
//   AppUser _UserFromFirebaseUser(User? user) {
//     return AppUser(uid: user?.uid);
//   }

//   // Auth Change User Stream
//   Stream<AppUser> get user {
//     return _auth.authStateChanges().map(_UserFromFirebaseUser);
//   }

//   // Anonymous SignIn
//   Future signInAnon() async {
//     try {
//       UserCredential Result = await _auth.signInAnonymously();

//       User? user = Result.user;
//       return _UserFromFirebaseUser(user!);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   Future SignOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
