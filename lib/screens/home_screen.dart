
import 'package:comics_skr_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bienvenido a mi app de comics'),
      ),
      bottomNavigationBar: CustomNavigationBottomBar(),
    );
  }
}