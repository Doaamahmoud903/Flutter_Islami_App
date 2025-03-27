import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/utils/app_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.pages});
  static const String routeName = "OnboardingScreen";

  final List<Map<String, String>> pages;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.2,
        title: Image.asset("assets/images/mainLogo.png"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black,
        child: IntroductionScreen(
          pages: widget.pages.map((page) {
            return PageViewModel(
              title: "",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    page["img"]!,
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.3,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    page["title"]!,
                    textAlign: TextAlign.center,
                    style:  AppStyles.fontBold24Primary,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      page["body"]!,
                      textAlign: TextAlign.center,
                      style: AppStyles.fontBold20,
                    ),
                  ),
                ],
              ),
              decoration: const PageDecoration(
                pageColor: Colors.black,
                contentMargin: EdgeInsets.only(top: 3),
              ),
            );
          }).toList(),
          done: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          onDone: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) =>  HomeScreen()),
            );
          },
          showBackButton: true,
          back: const Text("Back", style: TextStyle(color: Colors.white)),
          onSkip: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (_) => const HomeScreen()),
           // );
            Navigator.pop(context);
          },
          next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.grey,
            activeSize: Size(15.0, 10.0),
            activeColor: Colors.blue,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          globalBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}