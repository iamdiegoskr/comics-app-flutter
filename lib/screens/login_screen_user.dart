import 'package:comics_skr_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreenAnonymus extends StatelessWidget {

  LoginScreenAnonymus({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await _authService.signInAnonymus();
          },
          child: const Text('Ingresar como anonimo', style: TextStyle(color: Colors.white),),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue
          ),
        ),
      )
    );
  }
}