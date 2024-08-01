import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedLocationProvider extends ChangeNotifier {
  List<String> savedWeatherList = [];
  List savedList = [];

  Future<void> addToSavedLocation(
      String name,String region,String country, String status, dynamic temp,int isDay, dynamic maxtemp_c,dynamic mintemp_c) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool check = false;
    String data = "${name}_${region}_${country}_${status}_${temp}_${isDay}_${mintemp_c}_$maxtemp_c";
    for (int i = 0; i < savedWeatherList.length; i++) {
      if (savedList[i]['0'] == name && savedList[i]['1'] == region && savedList[i]['2'] == country) {
        check = true;
      }
    }
    if (check == false) {
      savedWeatherList.add(data);
      String store = '';
      Map storeMap = {};

      int wordIndex = 0;
      for (int i = 0; i < data.length; i++) {
        if (data[i] != '_') {
          store += data[i];
        } else {
          storeMap['$wordIndex'] = store;
          store = '';
          wordIndex++;
        }
      }
      storeMap['$wordIndex'] = store;
      savedList.add(storeMap);
    }
    print(savedList);
    sharedPreferences.setStringList('weather', savedWeatherList);
    Fluttertoast.showToast(
      msg: (check == false)
          ? 'Location add to favorites'
          : 'This location already exist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16,
    );
    notifyListeners();
  }

  Future<void> getList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    savedWeatherList = sharedPreferences.getStringList('weather') ?? [];

    String store = '';
    Map storeMap = {};

    for (int i = 0; i < savedWeatherList.length; i++) {
      String temp = savedWeatherList[i];
      int wordIndex = 0;
      for (int i = 0; i < temp.length; i++) {
        if (temp[i] != '_') {
          store += temp[i];
        } else {
          storeMap['$wordIndex'] = store;
          store = '';
          wordIndex++;
        }
      }
      storeMap['$wordIndex'] = store;
      savedList.add(storeMap);
    }
  }

  SavedLocationProvider() {
    getList();
  }

  void removeFromSaved(int index){
    savedList.removeAt(index);
    savedWeatherList.removeAt(index);
    notifyListeners();
  }
}
