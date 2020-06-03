import 'package:firebase_auth/firebase_auth.dart';
//import 'package:toast/toast.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<FirebaseUser>  get user {
    return _auth.onAuthStateChanged;
  }

  //register user with email and password
  Future registerUserWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.message);
      return e;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.message);
      return e;
    }
  }

  //signOut
  Future signOut() async{
    await _auth.signOut();
  }


}