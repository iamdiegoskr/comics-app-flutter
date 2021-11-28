import 'package:flutter/material.dart';

class CustomNavigationBottomBar extends StatefulWidget {
  const CustomNavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBottomBar> createState() => _CustomNavigationBottomBarState();
}

class _CustomNavigationBottomBarState extends State<CustomNavigationBottomBar> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (int currentIndex){
          setState(() {
            currentPage = currentIndex;
          });
        },
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