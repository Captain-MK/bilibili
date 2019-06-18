import 'package:flutter/material.dart';
import '../Fragment/animationPage.dart';
class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  var _listController;
  var _show = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listController = ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _show?AppBar(
        title: Text('我的'),
        backgroundColor: Colors.red,
        brightness: Brightness.light,
        centerTitle: true,
      ):null,
      body: NotificationListener(
        onNotification: (ScrollNotification note) {
          print(note.metrics.pixels.toInt());// 滚动位置。
          if (note.metrics.pixels.toInt() > 50){
            setState(() {
              _show = false;
            });
          }else{
            setState(() {
              _show = true;
            });
          }
        },
        child: new ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('今天吃什么？${index}'),
              leading: Icon(Icons.select_all),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>animationPage()));
              },
            );
          },
        ),
      ),
    );
  }
}
