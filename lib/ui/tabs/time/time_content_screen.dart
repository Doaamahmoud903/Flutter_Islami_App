import 'package:flutter/material.dart';
import 'package:islami/model/azkar_model.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class TimeContentScreen extends StatelessWidget {
  static const String routeName = "TimeContentScreen";

  final String categoryName;
  final List<ZikrItem> zikrItems;

  const TimeContentScreen({
    super.key,
    required this.categoryName,
    required this.zikrItems,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName ==  'أذكار بعد السلام من الصلاة المفروضة' ? "أذكار بعد الصلاه" : categoryName, style: AppStyles.fontBold24),
        backgroundColor: AppColor.primaryColor,
        leading: InkWell(
          onTap: Navigator.of(context).pop,
          child: Icon(Icons.arrow_back,
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(size.height*0.01),
        itemCount: zikrItems.length,
        itemBuilder: (context, index) {
          final item = zikrItems[index];
          return _buildZikrItem(item , size);
        },
      ),
    );
  }

  Widget _buildZikrItem(ZikrItem item, Size size) {
    return Card(
      margin: EdgeInsets.only(bottom: size.height*0.02),
      color: AppColor.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColor.primaryColor, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.height*0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to full width
          children: [
            // Main content (right-aligned)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                item.content,
                style: AppStyles.fontBold20White,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),

            if (item.description.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    item.description,
                    style: AppStyles.fontBold18White,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),

            if (item.count.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Counter (left-aligned)
                    Text(
                      'التكرار: ${item.count}',
                      style: AppStyles.fontBold16,
                      textDirection: TextDirection.rtl,
                    ),

                    // Optional: Add any right-aligned widget here
                    // const SizedBox(), // Empty space keeper
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}