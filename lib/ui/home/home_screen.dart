import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/hadith/hadith_tab.dart';
import 'package:islami/ui/tabs/quran/quran_tab.dart';
import 'package:islami/ui/tabs/radio/radio_tab.dart';
import 'package:islami/ui/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/ui/home/bottom_tap_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
 // String imgBg = AppAssets.iconMainBg;

  final List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundList = [
    AppAssets.iconMainBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,

  ];

  // void updateScreen(int index, String newBg) {
  //   setState(() {
  //     selectedIndex = index;
  //     imgBg = newBg;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundList[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title:  Image.asset(AppAssets.appBarLogo),
            backgroundColor: Colors.transparent,
            toolbarHeight: 150,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: tabs[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.primaryColor,
            ),
            child: BottomNavigationBar(
              selectedFontSize: 16,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                bottomTapBar(
                  imgPath: AppAssets.iconQuran,
                  label: "Quran",
                  i: 0,
                  selectedIndex: selectedIndex,
                  //onTapCallback: () => updateScreen(0, AppAssets.iconMainBg),
                ),
                bottomTapBar(
                  imgPath: AppAssets.iconHadith,
                  label: "Hadith",
                  i: 1,
                  selectedIndex: selectedIndex,
                  //onTapCallback: () => updateScreen(1, AppAssets.HadithBg),
                ),
                bottomTapBar(
                  imgPath: AppAssets.iconSebha,
                  label: "Sebha",
                  i: 2,
                  selectedIndex: selectedIndex,
                  //onTapCallback: () => updateScreen(2, AppAssets.SebhaBg),
                ),
                bottomTapBar(
                  imgPath: AppAssets.iconRadio,
                  label: "Radio",
                  i: 3,
                  selectedIndex: selectedIndex,
                  //onTapCallback: () => updateScreen(3, AppAssets.RadioBg),
                ),
                bottomTapBar(
                  imgPath: AppAssets.iconTime,
                  label: "Time",
                  i: 4,
                  selectedIndex: selectedIndex,
                  //onTapCallback: () => updateScreen(4, AppAssets.TimeBg),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
