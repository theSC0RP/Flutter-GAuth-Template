import 'package:firebase_auth/firebase_auth.dart';
import 'package:gauth/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign In
  Future signInWithEmailandPass(email, password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseObject(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register
  Future registerWithEmailandPass(email, password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseObject(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Create user object based on firebase user
  User _userFromFirebaseObject(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseObject); // .map(FirebaseUser(user) => {_userFromFirebaseObject(user)})
  }
}