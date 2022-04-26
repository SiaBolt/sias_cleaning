import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siascleaning/utils/theme.dart';

import '../../utils/core.dart';
import '../../utils/preference_sevice.dart';
import '../auth/login.dart';
import '../main_page/main_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash-screen";
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        String? token = await PreferencesService().getString(TOKEN);
        if (token == null || token.isEmpty) {
          Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(
              context,
              LoginScreen.routeName,
            ),
          );
        } else {
          Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(
              context,
              MainPage.routeName,
            ),
          );
        }
      },
    );
  }

  // _storeUserInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt(UserType, isViewed);
  //   print(prefs.getInt('onBoard'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.indigo,
          child: Column(
            children: [
              Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              const Text(
                "Sia's cleaning",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
