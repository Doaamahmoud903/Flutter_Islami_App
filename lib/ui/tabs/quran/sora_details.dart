import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/tabs/quran/quran_data.dart';
import 'package:islami/ui/tabs/quran/sora_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';
import 'package:provider/provider.dart';

class SoraDetails extends StatefulWidget {
  const SoraDetails({super.key});
  static const String routeName = "SoraDetails";

  @override
  State<SoraDetails> createState() => _SoraDetailsState();
}

class _SoraDetailsState extends State<SoraDetails> {
  List<String> verses = [];
  int? selectedIndex;
  late MostRecentProvider provider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.readMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentProvider>(context);

    final int index = ModalRoute.of(context)!.settings.arguments as int;
    if(verses.isEmpty){
      loadFile(index);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(englishQuranSurahs[index],
            style: AppStyles.fontBold20,
          ),
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Icon(Icons.arrow_back,
                color: AppColor.primaryColor,
              ),
            ),
          ),

        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width*0.04),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.maskRight),
                  Text(arabicAuranSuras[index],
                    style: AppStyles.fontBold24Primary,),
                  Image.asset(AppAssets.maskLeft),
                ],),
              Expanded(child: verses.isEmpty ?
              Center(child: CircularProgressIndicator(color: AppColor.primaryColor,))
                  :
              ListView.separated(
                  itemBuilder: (context , index){
                    return SoraContent(
                        index: index,
                        suraContent: verses[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                  itemCount: verses.length,
                  separatorBuilder:(context , index){
                    return SizedBox(height: height*0.01,);
                  },
              ),

              ),
              Image.asset(AppAssets.maskBottom),


            ],),

        ));}

  void loadFile(int index) async{
    String fileContent = await rootBundle.loadString('assets/sura_list/${index+1}.txt');
    List<String> suraLine = fileContent.split('\n');
    verses = suraLine;
    Future.delayed(Duration(seconds:1),()=>setState(() {}),);


  }
}