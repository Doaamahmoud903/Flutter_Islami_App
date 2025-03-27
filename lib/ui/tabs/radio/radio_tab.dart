import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/radio/radio_component.dart';
import 'package:islami/ui/tabs/radio/reciters.dart';
import 'package:islami/utils/app_colors.dart';



class RadioTab extends StatefulWidget {
  const RadioTab({super.key});
  static const String routeName = "RadioTab";

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar( 
        backgroundColor: AppColor.blackColor,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
        ),
        title: SizedBox(
          width: screenWidth,
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: 'Radio'),
              Tab(text: 'Reciters'),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.primaryColor,
              border: Border.all(
                color: Colors.transparent,
                width: 0,
              ),
            ),

            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            labelColor: AppColor.blackColor,
            unselectedLabelColor: AppColor.whiteColor,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Expanded(
              child: ListView.separated(
                itemBuilder: (context , index){
                  return RadioComponent(name: "Radio ${englishReciters[index]}");
                },
                separatorBuilder: (context , index){
                  return SizedBox(height: 10,);
                },
                itemCount: englishReciters.length,
              )
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context , index){
                      return RadioComponent(name: englishReciters[index]);
                      },
                  separatorBuilder: (context , index){
                    return SizedBox(height: 10,);
                  },
                  itemCount: englishReciters.length,
              )
          )
          
          // Center(child: Text('Radio Content Goes Here')),
          // Center(child: Text('Reciters List Goes Here')),
        ],
      ),
    );
  }
}