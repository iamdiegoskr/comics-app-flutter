import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenAnonymus extends StatelessWidget {
  const LoginScreenAnonymus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticacion firebase'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            try {
              UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
              Navigator.pushNamed(context, 'home');
            } on FirebaseAuthException catch (e) {
              print(e.toString());
            }
          },
          child: const Text('Ingresar como anonimo', style: TextStyle(color: Colors.white),),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(FirebaseAuth.instance.currentUser);
        },
      ),
    );
  }
}