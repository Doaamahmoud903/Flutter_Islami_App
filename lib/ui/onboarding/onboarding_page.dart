import 'package:flutter/material.dart';
import 'package:islami/ui/onboarding/onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  static const String routeName = "OnboardingPage";

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        "img": "assets/images/Frame1.png",
        "title": "Welcome To Islami",
        "body": "",
      },
      {
        "img": "assets/images/Frame2.png",
        "title": "Welcome To Islami",
        "body": "We Are Very Excited To Have You In Our Community",
      },
      {
        "img": "assets/images/Frame3.png",
        "title": "Reading the Quran",
        "body": "Read, and your Lord is the Most Generous",
      },
      {
        "img": "assets/images/Frame4.png",
        "title": "Bearish",
        "body": "Praise the name of your Lord, the Most High",
      },
      {
        "img": "assets/images/Frame5.png",
        "title": "Holy Quran Radio",
        "body": "You can listen to the Holy Quran Radio through the application for free and easily",
      }
    ];

    return OnboardingScreen(pages: onboardingData);
  }
}
