import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome to Purin's World!",
      body: "Cozy vibes, sweet treats, and endless pudding dreams.",
      image: Center(
        child: Image.asset("photo/pompurinprofile.jpg", height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFFFF4D6),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA3774A),
        ),
        bodyTextStyle: TextStyle(fontSize: 16, color: Color(0xFF8C5E3C)),
      ),
    ),
    PageViewModel(
      title: "Share Smiles with Friends",
      body: "Bring happiness with pudding, love, and creativity.",
      image: Center(
        child: Image.asset("photo/pompurinprofile2.jpg", height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFFFF4D6),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA3774A),
        ),
        bodyTextStyle: TextStyle(fontSize: 16, color: Color(0xFF8C5E3C)),
      ),
    ),
    PageViewModel(
      title: "Let's Get Cozy!",
      body: "Start your journey in PomPomPurin's cozy gallery.",
      image: Center(
        child: Image.asset("photo/pompurinprofile3.jpg", height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFFFF4D6),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA3774A),
        ),
        bodyTextStyle: TextStyle(fontSize: 16, color: Color(0xFF8C5E3C)),
      ),
    ),
  ];

  Future<void> onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFFFFF4D6),
      pages: pages,
      dotsDecorator: DotsDecorator(
        size: const Size(10, 10),
        activeSize: const Size(20, 10),
        color: const Color(0xFFFFE29A),
        activeColor: const Color(0xFFFFD369),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      showDoneButton: true,
      done: const Text(
        "Start",
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFA3774A)),
      ),
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(color: Color(0xFFA3774A))),
      showNextButton: true,
      next: const Icon(Icons.arrow_forward, size: 20, color: Color(0xFFA3774A)),
      onDone: () => onDone(context),
      curve: Curves.easeInOut,
    );
  }
}
