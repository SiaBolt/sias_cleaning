import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siascleaning/screens/auth/login.dart';
import 'package:siascleaning/screens/splash/splash_screen.dart';

import '../main_page/main_page.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = "/onboard";

  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    Navigator.of(context).pushNamed(SplashScreen.routeName);
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/fullscreen1.jpg',
      fit: BoxFit.fitWidth,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.topCenter,
    );
  }

  Widget _buildImage(String assetName,
      [double width = 350, double height = 500]) {
    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 22.0, color: Colors.white);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 38.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      imagePadding: EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
      titlePadding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 16.0),
      pageColor: Colors.blue,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color.fromRGBO(144, 202, 249, 1),
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: Text(
              'Sia\'s cleaning',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Need help with cleaning? ",
          body: "Trust us to take care of your home.",
          image: _buildImage('onboard1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome to Sia's application",
          body: "cleaning service application",
          image: _buildImage('onboard2.png', 350),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Safety and security.",
          body:
              "Just one Tap book maid from anywhere and anytime. Verified workers in terms of safety and security.",
          image: _buildImage('onboard3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Trained workers.",
          body: "Providing well trained and polite workers.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 13.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
