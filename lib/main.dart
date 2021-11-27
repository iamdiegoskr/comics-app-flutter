
import 'package:comics_skr_app/screens/home_screen.dart';
import 'package:comics_skr_app/screens/login_screen_user.dart';
import 'package:comics_skr_app/screens/verify_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'verify',
      routes: {
        'verify':(_)=> const VerifyUser(),
        'home': (_) => const HomeScreen(),
        'login' :(_)=> const LoginScreenAnonymus()
      },
    );
  }
}