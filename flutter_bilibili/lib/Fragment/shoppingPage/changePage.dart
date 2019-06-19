import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
class changePage extends StatefulWidget {
  @override
  _changePageState createState() => _changePageState();
}

class _changePageState extends State<changePage> {
  Widget items (BuildContext c,int index){
    final appmodel = AppModel.of(context);
    return InkWell(
      child: Container(
        height: 150.0,
        color: themeList[index],
        child: Center(
          child: Text(index.toString(),style: TextStyle(fontSize: 25.0,color: Colors.white),),
        ),
      ),
      onTap: (){
        appmodel.changeTheme(index);
        print('点击了');
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('颜色切换'),),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
            itemCount: themeList.length,
            itemBuilder: (c,index){
              return items(c,index);
            }),
      ),
    );
  }
}
