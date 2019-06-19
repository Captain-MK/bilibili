import 'package:flutter_bilibili/Fragment/homePage/provide/home_provide.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppModel extends Model{
  int _themeIndex=0;
  get themeIndex => _themeIndex;
  void changeTheme(int themeIndex) async {
    _themeIndex = themeIndex;
    notifyListeners();
    saveIndex();
  }
  void saveIndex () async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setInt('navIndex', themeIndex);
  }
  Future<int> getSaveIndex ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    int index = await sp.getInt('navIndex');
    if (index != null){
      return index;
    }
    return 0;
  }
  static AppModel of(BuildContext context) =>
      ScopedModel.of<AppModel>(context,rebuildOnChange: true);
}
final List<Color> themeList = [
  Colors.pink,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.orange,
  Colors.green,
  Colors.blue,
  Colors.lightBlue,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.cyan,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.yellow,
];