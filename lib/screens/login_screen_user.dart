import 'package:comics_skr_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreenAnonymus extends StatelessWidget {

  LoginScreenAnonymus({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    //   body: Center(
    //     child: TextButton(
    //       onPressed: () async {
    //         await _authService.signInAnonymus();
    //       },
    //       child: const Text('Ingresar como anonimo', style: TextStyle(color: Colors.white),),
    //       style: TextButton.styleFrom(
    //         backgroundColor: Colors.blue
    //       ),
    //     ),
    //   )

      body: Stack(
        children: const [
          _BackgroundLogin()
        ],
      ),
    );
  }
}

class _BackgroundLogin extends StatelessWidget {
  const _BackgroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/postermarvel.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.76),
            BlendMode.darken,
          )
        )
      ),
    );
  }
}