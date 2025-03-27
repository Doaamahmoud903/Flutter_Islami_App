import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/tabs/quran/quran_data.dart';
import 'package:islami/ui/tabs/quran/sora_component.dart';
import 'package:islami/ui/tabs/quran/sora_details.dart';
import 'package:islami/utils/app_style.dart';
import 'package:provider/provider.dart';

class MostRecentScreen extends StatefulWidget {
  const MostRecentScreen({super.key});

  @override
  State<MostRecentScreen> createState() => _MostRecentScreenState();
}

class _MostRecentScreenState extends State<MostRecentScreen> {
  late MostRecentProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.readMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = context.watch<MostRecentProvider>(); // Correct provider usage

    return Visibility(
      visible: provider.recentlyList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently ", style: AppStyles.fontBold18White),
          SizedBox(height: height * 0.02),
          SizedBox(
            width: double.infinity,
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SoraDetails.routeName,
                      arguments: provider.recentlyList[index],
                    );
                  },
                  child: SoraComponent(
                    soraNameEn: englishQuranSurahs[provider.recentlyList[index]],
                    soraNameAr: arabicAuranSuras[provider.recentlyList[index]],
                    soraNums: AyaNumber[provider.recentlyList[index]],
                  ),
                );
              },
              itemCount: provider.recentlyList.length,
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
