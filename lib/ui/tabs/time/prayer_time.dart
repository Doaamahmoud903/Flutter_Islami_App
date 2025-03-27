import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/time/prayer_time_card.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class PrayerTimesScreen extends StatelessWidget {
  PrayerTimesScreen({super.key});

  final DateTime staticDate = DateTime(2023, 11, 15);

  static const List<String> monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  static const List<String> dayNames = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    final prayerTimes = {
      'Fajr': '04:20 AM',
      'Sunrise': '05:49 AM',
      'Dhuhr': '11:59 PM',
      'Asr': '03:29 PM',
      'Maghrib': '06:10 PM',
      'Isha': '07:29 PM',
    };

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomHeaderClipper(),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  color: AppColor.primaryColor,
                ),
              ),

              Positioned(
                top: 10,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dateContainer("27 Mar, 2025"),
                    Column(
                      children: [
                        Text("Pray Time",
                            style: AppStyles.fontBold20black),
                        Text("Tuesday",
                            style: AppStyles.fontBold20black),
                      ],
                    ),
                    _dateContainer("27 Ram, 1446"),
                  ],
                ),
              ),

              Positioned(
                top: 80,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: 140,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: prayerTimes.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      String prayerName = prayerTimes.keys.elementAt(index);
                      String prayerTime = prayerTimes.values.elementAt(index);
                      bool isActive = prayerName == 'Asr'; // الصلاة الحالية

                      return PrayerTimeCard(
                        prayerName: prayerName,
                        prayerTime: prayerTime,
                        isActive: isActive,
                      );
                    },
                  ),
                ),
              ),

              // 📌 توقيت الصلاة القادمة
              Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Next Pray - 02:32",
                        style: AppStyles.fontBold16Black,),
                    Icon(Icons.volume_off, color: Colors.black, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📌 ودجت عرض التاريخ داخل الهيدر
  Widget _dateContainer(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.brownColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: AppStyles.fontBold16)
    );
  }
}

// 📌 كلاس رسم الهيدر المنحني
class CustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
