import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../shoppingPage/changePage.dart';
class shoppingPage extends StatefulWidget {
  @override
  _shoppingPageState createState() => _shoppingPageState();
}

class _shoppingPageState extends State<shoppingPage> {
  @override
  Widget build(BuildContext context) {
    final appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('主题颜色',style: TextStyle(fontSize: 20.0)),
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (content)=>changePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}