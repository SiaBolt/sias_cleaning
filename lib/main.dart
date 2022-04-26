import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siascleaning/routes.dart';
import 'package:siascleaning/screens/onboarding_page/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siascleaning/screens/splash/splash_screen.dart';
import 'package:siascleaning/utils/core.dart';
import 'package:siascleaning/utils/theme.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt(ISVIEWED);
  isViewed ??= 1;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute:
          isViewed != 0 ? OnBoardingPage.routeName : SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
