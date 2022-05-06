import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siascleaning/screens/main_page/add_order.dart';
import 'package:siascleaning/screens/main_page/home_page.dart';
import 'package:siascleaning/screens/main_page/profile_screen.dart';
import 'package:siascleaning/screens/main_page/question_page.dart';

import '../../data/provider_values.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  initState() {
    super.initState();
    context.read<ProviderValues>().fetchQuestions();
    context.read<ProviderValues>().getUserInfo();
    context.read<ProviderValues>().fetchMyOrders();
  }

  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      HomePage(
        function: () => setState(() {
          _selectedIndex = 3;
        }),
      ),
      QuestionScreen(
        function: () => setState(() {
          _selectedIndex = 3;
        }),
      ),
      OrderScreen(),
      ProfileScreen(),
    ];

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
              showUnselectedLabels: true,
              elevation: 0, // to get rid of the shadow
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.indigo,
              onTap: onItemTapped,
              backgroundColor: Colors
                  .white, // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,
              showSelectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer),
                  label: 'Q&A',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded),
                  label: 'Select',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
