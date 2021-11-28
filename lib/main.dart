
import 'package:comics_skr_app/screens/detail_comic_screen.dart';
import 'package:comics_skr_app/screens/home_screen.dart';
import 'package:comics_skr_app/screens/login_screen_user.dart';
import 'package:comics_skr_app/screens/auth_screen.dart';
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
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffDA3B62)
      ),
      // theme: ThemeData.dark().copyWith(
      //   appBarTheme: AppBarTheme(
      //     color: Colors.red
      //   )
      // ),
      title: 'Material App',
      initialRoute: 'auth',
      routes: {
        'auth':(_)=> const AuthScreen(),
        'home': (_) => const HomeScreen(),
        'login' :(_)=> LoginScreenAnonymus(),
        'detail': (_) => const DetailComic()
      },
    );
  }
}