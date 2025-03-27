// time_item.dart
import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class TimeItem extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;

  const TimeItem({
    super.key,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: _buildBoxDecoration(),
        child: _buildContent(size),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColor.blackColor,
      border: Border.all(
        color: AppColor.primaryColor,
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColor.primaryColor,
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  Widget _buildContent(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCategoryIcon(size),
           SizedBox(height: size.height * 0.01),
          _buildCategoryName(),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(Size size) {
    return Image.asset(
      _getIconForCategory(categoryName),
      width: size.width * 0.35,
      height: size.width * 0.3,
      fit: BoxFit.contain,
    );
  }

  Widget _buildCategoryName() {
    // List<String> words = categoryName.split(' '); // Split by spaces
    // String catName =  words.take(3).join(' ');
    return Text(
      categoryName ==  'أذكار بعد السلام من الصلاة المفروضة' ? "أذكار بعد الصلاه" : categoryName,
      style: AppStyles.fontBold20White.copyWith(
        shadows: [
          Shadow(
            color: AppColor.primaryColor,
            blurRadius: 10,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  String _getIconForCategory(String category) {
    switch (category) {
      case 'أذكار الصباح': return AppAssets.morningIcon;
      case 'أذكار المساء': return AppAssets.eveningIcon;
      case 'أذكار بعد السلام من الصلاة المفروضة': return AppAssets.prayerIcon;
      case 'تسابيح': return AppAssets.tasabeehIcon;
      case 'أذكار النوم': return AppAssets.sleepIcon;
      case 'أذكار الاستيقاظ': return AppAssets.wakeupIcon;
      case 'أدعية قرآنية': return AppAssets.quranIcon;
      case 'أدعية الأنبياء': return AppAssets.prophetsIcon;
      default: return AppAssets.defaultIcon;
    }
  }
}