import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class SoraContent extends StatelessWidget {
  final int index;
  final String suraContent;
  final bool isSelected;
  final VoidCallback onTap;

  const SoraContent({
    super.key,
    required this.index,
    required this.suraContent,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: height * 0.02),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColor.primaryColor,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        alignment: Alignment.center,
        child: Text(
          "$suraContent [${index + 1}]",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyles.fontBold22Primary.copyWith(
            color: isSelected ? AppColor.blackColor : null,
          ),
        ),
      ),
    );
  }
}