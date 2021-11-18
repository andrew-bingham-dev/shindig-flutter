import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shindig/models/user_model.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  registering
}
/*
- Uninitialized - Checking user is logged or not, the Splash Screen will be shown
- Authenticated - User is authenticated successfully, Home Page will be shown
- Authenticating - Sign In button just been pressed, progress bar will be shown
- Unauthenticated - User is not authenticated, login page will be shown
- Registering - User just pressed registering, progress bar will be shown
 */

class FirebaseProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Status _status = Status.uninitialized;

  final UserModel _user = UserModel();

  Status get status {
    return _status;
  }

  UserModel get getUser {
    return _user;
  }

  void logout() async {
    _auth.signOut();

    notifyListeners();
  }

  void updateUserFromFirebase() async {
    if (_auth.currentUser != null) {
      final colRef = _firestore.collection('users');
      _status = Status.authenticated;

      final DocumentSnapshot _userFromFirebase =
          await colRef.doc(_auth.currentUser?.uid).get();

      Map<String, dynamic> _userSnapshot =
          _userFromFirebase.data() as Map<String, dynamic>;

      // save user data to user object
      _user.uid = _auth.currentUser?.uid;
      _user.email = _auth.currentUser?.email;
      _user.dob = _userSnapshot['dob'];
      _user.firstName = _userSnapshot['firstName'];
      _user.lastName = _userSnapshot['lastName'];
      _user.isAdmin = _userSnapshot['isAdmin'];

      notifyListeners();
    } else {
      // empty the user object
      _user.uid = null;
      _user.email = null;
      _user.dob = null;
      _user.firstName = null;
      _user.lastName = null;
      _user.isAdmin = null;

      notifyListeners();
    }
  }
}
