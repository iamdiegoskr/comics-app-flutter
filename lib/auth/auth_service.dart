
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.authStateChanges();

  //Anonymus sign in
  Future<bool> signInAnonymus() async{
    try {
      UserCredential credential = await _auth.signInAnonymously();
      if(credential.user!=null){
        print(credential.user!.uid);
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Logout
  Future<void> signOutAnonymus() async{
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

}