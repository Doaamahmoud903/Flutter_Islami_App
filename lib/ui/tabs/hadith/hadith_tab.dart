import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami/ui/tabs/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});
  static const String routeName = "HadithTab";

  @override
  Widget build(BuildContext context) {

    return  CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.67,
          reverse: true,
      enableInfiniteScroll: true,
      enlargeCenterPage: true),
      items: List.generate(50, (index) => index+1).map((i) {
        return HadithItem(index: i,);
      }).toList(),
    );
  }
}
