import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

BottomNavigationBarItem bottomTapBar({
  required String imgPath,
  required String label,
  required int i,
  required int selectedIndex,
  //required Function() onTapCallback,
}) {
  return BottomNavigationBarItem(
    icon: GestureDetector(
      //onTap: onTapCallback,
      child: selectedIndex == i
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.hoverColor,
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(AssetImage(imgPath)),
      )
          : ImageIcon(AssetImage(imgPath)),
    ),
    label: label,
  );
}
