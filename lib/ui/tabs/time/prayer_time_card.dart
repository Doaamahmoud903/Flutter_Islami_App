import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class PrayerTimeCard extends StatelessWidget {
  final String prayerName;
  final String prayerTime;
  final bool isActive;

  const PrayerTimeCard({super.key,
    required this.prayerName,
    required this.prayerTime,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02
      ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.blackColor,
              AppColor.brownColor, // Darker blue
            ],
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              prayerName,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.18,
              padding:EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
              ) ,
              child: Text(
                prayerTime,
                style: AppStyles.fontBold24,
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      
    );
  }
}