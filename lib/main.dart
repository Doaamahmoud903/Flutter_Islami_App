import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/tabs/quran/sora_details.dart';
import 'package:islami/ui/tabs/time/prayer_time.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/onboarding/onboarding_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MostRecentProvider(),
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingPage.routeName,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        OnboardingPage.routeName : (context)=>OnboardingPage(),
        SoraDetails.routeName : (context)=>SoraDetails(),

      }
    );
  }
}

