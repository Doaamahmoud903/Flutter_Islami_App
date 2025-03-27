import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/tabs/quran/most_recent_screen.dart';
import 'package:islami/ui/tabs/quran/quran_data.dart';
import 'package:islami/ui/tabs/quran/sora_component.dart';
import 'package:islami/ui/tabs/quran/sora_details.dart';
import 'package:islami/ui/tabs/quran/sura_list.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';
import 'package:islami/utils/shared_perferences.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});
  static const String routeName = "QuranTab";

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
   List<int> filterIndciesList = List.generate(114, (index) => index);
   bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostRecentProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText)=>{
              setState(() {
                isTyping = newText.isNotEmpty;
              }),
              filterListByNewTxt(newText)
            },
            style: TextStyle(color: AppColor.whiteColor),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.01 , vertical:  height*0.01),
                child: Image.asset(AppAssets.iconQuranField, width: 20, height: 20),
              ),
              hintText: "Sura Name",
              hintStyle: AppStyles.fontBold18White,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height*0.02,),
          if(!isTyping) MostRecentScreen(),
          Text("Suras List ", style: AppStyles.fontBold18White),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context , index){
                return Divider(
                  thickness: 2,
                  color: AppColor.primaryColor,
                  indent: width*0.1,
                  endIndent: width*0.1,
                );
              },
              itemBuilder: (context , index){
                return InkWell(
                  onTap: (){
                    provider.updateMostRecentIndciesList(filterIndciesList[index]);
                    Navigator.of(context).pushNamed(
                        SoraDetails.routeName,
                        arguments: filterIndciesList[index]
                    );
                  },
                  child: SuraList(index: filterIndciesList[index]),
                );
              } ,
              itemCount: filterIndciesList.length,
            ),
          ),



        ],
      ),
    );
  }

  void filterListByNewTxt(String newText){
     List <int> filteredList = [];
     for(int i = 0 ; i< englishQuranSurahs.length ; i++){
       if(englishQuranSurahs[i].toLowerCase().contains(newText.toLowerCase())){
         filteredList.add(i);
       }else if(arabicAuranSuras[i].contains(newText)){
         filteredList.add(i);
       }
       filterIndciesList = filteredList;
     }
     setState(() {

     });
  }
}
