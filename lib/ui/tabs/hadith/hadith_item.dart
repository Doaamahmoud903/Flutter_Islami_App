import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class HadithItem extends StatefulWidget {
  final int index;
  const HadithItem({super.key , required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadeth;
  @override
  void initState(){
    super.initState();
    loadHadithFile(widget.index);

  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return hadeth == null
        ? Center(child: CircularProgressIndicator(color: AppColor.blackColor))
        : Container(
      width: width * 0.8,
      height: height * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithCardBackGround),
          fit: BoxFit.contain,
          opacity: 0.2,
        ),
      ),

        child: Column(
          children: [
            // Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.02 , vertical: height*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.cornerLeft),
                  Expanded(
                    child: Text(
                      hadeth?.title ?? "",
                      style: AppStyles.fontBold22,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Image.asset(AppAssets.cornerRight),
                ],
              ),
            ),

            // Content Area - This will now take remaining space
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric( horizontal:width*0.03 ),
                child: SingleChildScrollView(
                  child: Text(
                    hadeth?.content ?? "",
                    style: AppStyles.fontBold20black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Image.asset(AppAssets.mosqueBottom,
                  fit: BoxFit.contain,),
                ),
              ],
            )

          ],

      ),
    );
  }

  void loadHadithFile(index) async{
   String fileContent = await rootBundle.loadString("assets/hadith_list/h$index.txt");
   int lineIndex = fileContent.indexOf("\n");
   String title = fileContent.substring(0,lineIndex);
   String content = fileContent.substring(lineIndex+1);
   hadeth = Hadith(title:title , content:content);
   setState(() {

   });
  }
}