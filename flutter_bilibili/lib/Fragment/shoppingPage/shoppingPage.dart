import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../shoppingPage/changePage.dart';
import 'dart:async';
class shoppingPage extends StatefulWidget {
  @override
  _shoppingPageState createState() => _shoppingPageState();
}

class _shoppingPageState extends State<shoppingPage> {
  bool _switch = false;
  double _slider = 0.3;



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
            Switch.adaptive(value: _switch, onChanged: (value){
              setState(() {
                _switch = value;
              });
            }),
            Slider(
                value: _slider,
                divisions: 10, //分成段，10份
                activeColor: Colors.red,
                inactiveColor: Colors.green,
                onChanged: (value){
                  setState(() {
                    _slider = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                backgroundColor:Colors.amber,
              ),
            ),
            RichText(text: TextSpan(text: '我爱你',style: TextStyle(color: Colors.red),children: [TextSpan(text: '我爱你',style: TextStyle(color: Colors.greenAccent)),])),
            RotatedBox(quarterTurns: 1,child: Text('hello world'),),

          ],
        ),
      ),
    );
  }
}