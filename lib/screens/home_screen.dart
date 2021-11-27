import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth.signOut();
              Navigator.pushNamed(context, 'verify');
          }, icon: Icon(Icons.logout))
        ],
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text('Home welcome'),
      ),
    );
  }
}