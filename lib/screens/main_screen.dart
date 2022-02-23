import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/home.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import './favourites_screen.dart';
import './home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;
  int focusedPage = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    FavouritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      focusedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PageView(
      //   physics: NeverScrollableScrollPhysics(),
      //   controller: _pageController,
      //   onPageChanged: onPageChanged,
      //   children: List.generate(4, (index) => Home()),
      // ),
      body: _widgetOptions.elementAt(focusedPage),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, -3),
            )
          ]
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          elevation: 10,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: '',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: '',
                    backgroundColor: Colors.white,
                ),
              ],
              currentIndex: focusedPage,
              iconSize: 20,
              onTap: _onItemTapped,
              ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).accentColor : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
