import 'package:flutter/material.dart';
import 'package:siascleaning/screens/main_page/home_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Icon(Icons.offline_bolt_outlined),
    Icon(Icons.person),
    Icon(Icons.date_range),
    Icon(Icons.remove_red_eye),
  ];
  static int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: Container(
        child: _pages.elementAt(
          _selectedIndex.toInt(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              showUnselectedLabels: false,
              elevation: 0, // to get rid of the shadow
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.indigo,
              onTap: _onItemTapped,
              backgroundColor: Colors
                  .white, // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grade),
                  label: 'Level',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Achievements',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]),
        ),
      ),
    );
  }
}
