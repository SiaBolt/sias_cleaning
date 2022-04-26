import 'package:flutter/material.dart';
import 'package:siascleaning/screens/auth/login.dart';
import 'package:siascleaning/screens/auth/registration_screen.dart';
import 'package:siascleaning/screens/main_page/main_page.dart';
import 'package:siascleaning/screens/onboarding_page/onboard_page.dart';
import 'package:siascleaning/screens/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      // case VacancyDetail.routeName:
      //   final args = settings.arguments as Vacancy;
      //   return MaterialPageRoute(builder: (_) => VacancyDetail(vacancy: args));
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => MainPage());
      case OnBoardingPage.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
