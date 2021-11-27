import 'package:flutter/material.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  const CustomNavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: const Color(0xffCC1B47),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Comics'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Games'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos'
          ),
        ],
    );
  }
}