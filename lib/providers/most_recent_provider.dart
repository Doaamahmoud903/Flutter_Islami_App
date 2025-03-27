import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_perferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int>recentlyList = [];

  void readMostRecentList() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>recentlyListAsString = prefs.getStringList(prefKeys.mostRecentKey) ?? [];
    recentlyList = recentlyListAsString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }

  void updateMostRecentIndciesList (newSuraIndex) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>recentlyList = prefs.getStringList(prefKeys.mostRecentKey) ?? [];
    // if(recentlyList.contains("$newSuraIndex")){
    //   recentlyList.remove("$newSuraIndex");
    //   recentlyList.insert(0, "$newSuraIndex");
    // }else{
    //   recentlyList.insert(0, "$newSuraIndex");
    // }
    recentlyList.insert(0, "$newSuraIndex");
    List<String> uniqueRecentlyList = recentlyList.toSet().toList();
    if(uniqueRecentlyList.length > 5){
      uniqueRecentlyList.removeLast(); //remove the old
      //uniqueRecentlyList = uniqueRecentlyList.sublist(0 , 5);
    }
    await prefs.setStringList(prefKeys.mostRecentKey, uniqueRecentlyList);
  }
}