import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/azkar_model.dart';
import 'package:islami/ui/tabs/time/prayer_time.dart';
import 'package:islami/ui/tabs/time/time_content_screen.dart';
import 'package:islami/ui/tabs/time/time_item.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});
  static const String routeName = "TimeTab";

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  Map<String, List<ZikrItem>> _azkarData = {};

  @override
  void initState() {
    super.initState();
    _loadAzkarData();
  }

  Future<void> _loadAzkarData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/azkar_list/azkar.json');
      final jsonData = json.decode(jsonString);

      final result = <String, List<ZikrItem>>{};

      // Handle both cases where jsonData might be a List or a Map
      if (jsonData is Map<String, dynamic>) {
        jsonData.forEach((category, items) {
          if (items is List) {
            result[category] = items
                .whereType<Map<String, dynamic>>() // Ensure each item is a Map
                .map(ZikrItem.fromJson)
                .toList();
          }
        });
      } else if (jsonData is List) {
        // If your JSON is a list at root level
        result['Azkar'] = jsonData
            .whereType<Map<String, dynamic>>()
            .map(ZikrItem.fromJson)
            .toList();
      }

      setState(() {
        _azkarData = result;
      });
    } catch (e) {
      debugPrint("Error loading Azkar data: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(  // ✅ Limit height
              height: height * 0.4, // 90% of screen height
              child: PrayerTimesScreen(),
            ),
          ),
          Expanded(
            child: _azkarData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Azkar",
                 ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: height*0.3,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    reverse: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: _azkarData.keys.map((category) => TimeItem(
                    categoryName: category,
                    onTap: () => _navigateToContentScreen(context, category),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _navigateToContentScreen(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimeContentScreen(
          categoryName: category,
          zikrItems: _azkarData[category] ?? [],
        ),
      ),
    );
  }
}