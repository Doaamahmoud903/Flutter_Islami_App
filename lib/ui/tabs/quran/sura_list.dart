import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/quran/quran_data.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_style.dart';

class SuraList extends StatelessWidget {
  final int index;
   SuraList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  Container(
      padding: EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.01
      ),
      width: double.infinity,
      height: height*0.09,
      decoration: BoxDecoration(
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.soraNumShape),
              Text(
                  (index+1).toString(),
                  style: AppStyles.fontBold18White
              ),
            ],
          ),
          SizedBox(width: width*0.09,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                englishQuranSurahs[index],
                style: AppStyles.fontBold20White,
                textAlign: TextAlign.start,
              ),
              Text(
                "${AyaNumber[index]} Verses",
                style: AppStyles.fontBold14,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Spacer(),
          Text(
            arabicAuranSuras[index],
            style: AppStyles.fontBold20White,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
