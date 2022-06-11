import 'package:firebase_auth/firebase_auth.dart';

class AppState {

  AppState() {
    FirebaseAuth.instance.signInAnonymously().then(
            (UserCredential userCredential) => _userId = userCredential.user!.uid);
  }

  late String _userId;

  String get userId => _userId;

  String _name = "";

  void setName(String name) => _name = name;

  String get name => _name;
}
