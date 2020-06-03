import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register user with email and password
  Future registerUserWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }


}