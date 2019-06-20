import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../shoppingPage/changePage.dart';
import 'dart:async';
class shoppingPage extends StatefulWidget {
  @override
  _shoppingPageState createState() => _shoppingPageState();
}

class _shoppingPageState extends State<shoppingPage> {
  int _index=0;
  void getindex ()async{
    _index = await AppModel().getSaveIndex();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getindex();
  }
  @override
  Widget build(BuildContext context) {
    final model = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('主题颜色',style: TextStyle(fontSize: 20.0)),
              color: themeList[model.themeIndex != 0?model.themeIndex:_index],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (content)=>changePage()));
              },
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}