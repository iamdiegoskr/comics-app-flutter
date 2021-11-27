import 'package:comics_skr_app/auth/auth_service.dart';
import 'package:comics_skr_app/screens/home_screen.dart';
import 'package:comics_skr_app/screens/login_screen_user.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: _authService.user,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Image(
                width: 80,
                image: AssetImage('assets/marvelappbar.png')
            ),
            actions: [
              if(snapshot.data!=null)
                IconButton(onPressed: ()=> _authService.signOutAnonymus() , icon: const Icon(Icons.exit_to_app))
            ],
          ),
          body: snapshot.data!=null? const HomeScreen() :  LoginScreenAnonymus()

        );
      },
    );
  }
}