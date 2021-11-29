import 'package:comics_skr_app/provider/comics_provider.dart';
import 'package:comics_skr_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    ComicsProvider _comicsProvider = Provider.of<ComicsProvider>(context);

      List<Widget> _widgetOptions = <Widget>[
      ComicsPage(comics:_comicsProvider.listComics),
      const GamesPage(),
      const FavoritesPage()
    ];


    return Scaffold(
      body:  _widgetOptions.elementAt(currentPage),
      bottomNavigationBar: BottomNavigationBar(
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
      )
    );
  }
}