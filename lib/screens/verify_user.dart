import 'package:comics_skr_app/screens/home_screen.dart';
import 'package:comics_skr_app/screens/login_screen_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyUser extends StatelessWidget {
  const VerifyUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(FirebaseAuth.instance.currentUser!=null){
      return const HomeScreen();
    }else{
      return const LoginScreenAnonymus();
    }
    //return LoginScreenAnonymus();
  }
}