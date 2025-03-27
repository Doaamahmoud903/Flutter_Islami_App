import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sebha_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_style.dart';
import 'dart:convert';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  static const String routeName = "SebhaTab";

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  List<Tasbeeh> tasbeehList = [];
  int currentIndex = 0;
  int counter = 0;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    // تهيئة المتحكم للاهتزاز
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // تعريف حركة الاهتزاز
    _shakeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.05), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -0.05, end: 0.03), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.03, end: -0.02), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -0.02, end: 0.01), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.01, end: 0.0), weight: 1),
      ],
    ).animate(CurvedAnimation(
      parent: _shakeController,
      curve: Curves.easeOut,
    ));

    _loadTasbeehData();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void decreaseCount() {
    // تشغيل اهتزاز الصورة
    _shakeController.forward(from: 0.0);

    setState(() {
      if (counter > 0) {
        counter--;
      }
      if (counter == 0) {
        _nextTasbeeh();
      }
    });
  }

  void _nextTasbeeh() {
    setState(() {
      currentIndex = (currentIndex + 1) % tasbeehList.length;
      counter = int.parse(tasbeehList[currentIndex].count);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.02),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tasbeehList.isNotEmpty ? tasbeehList[currentIndex].description : "",
                style: AppStyles.fontBold24,
                overflow: TextOverflow.visible,
                softWrap: true,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              )
            ],
          ),
          Expanded(
            child: tasbeehList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(_shakeAnimation.value),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: decreaseCount,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AppAssets.sebhaTabBg),


                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: width*0.04 , vertical: height*0.04),
                                  child: Text(
                                    tasbeehList[currentIndex].content.split("،").join("\n"),
                                    style: AppStyles.fontBold30,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,

                                  ),
                                ),
                              ),
                              Text(
                                "$counter",
                                style: AppStyles.fontBold36,
                              ),
                            ],

                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadTasbeehData() async {
    try {
      final String response = await rootBundle.loadString('assets/azkar_list/azkar.json');
      final data = json.decode(response)['تسابيح'] as List;
      setState(() {
        tasbeehList = data.map((item) => Tasbeeh.fromJson(item)).toList();
        if (tasbeehList.isNotEmpty) {
          counter = int.parse(tasbeehList[currentIndex].count);
        }
      });
    } catch (e) {
      debugPrint("Error loading tasbeeh data: $e");
    }
  }
}