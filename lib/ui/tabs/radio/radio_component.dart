import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class RadioComponent extends StatelessWidget {
  final String name;
 const RadioComponent({super.key , required this.name});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.only(top: screenHeight*0.04 , left: screenWidth*0.04 , right: screenWidth*0.04),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppAssets.mosqueBottom),
          Column(
            children: [
              Text(name,
                style: AppStyles.fontBold16Black,
              ),
              SizedBox(height: 10,),
              Image.asset(AppAssets.icons ),
            ],
          )
        ],
      ),
    );
  }
}
