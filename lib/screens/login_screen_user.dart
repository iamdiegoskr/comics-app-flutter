import 'package:comics_skr_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreenAnonymus extends StatelessWidget {

  LoginScreenAnonymus({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundLogin(),
          _ContentLogin()
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


class _ContentLogin extends StatelessWidget {
  _ContentLogin({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon
            const Image(
              width: 100,
              image: AssetImage('assets/marvelicon.png')
            ),

            //Button login
            TextButton(
              onPressed: () async {
                await _authService.signInAnonymus();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6 ),
                  child: const Text('Loguin anonimo', style: TextStyle(color: Colors.white))
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffBD1836),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}