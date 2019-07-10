import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';
import '../../entity_factory.dart';
import '../shoppingPage/changePage.dart';
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class shoppingPage extends StatefulWidget {
  @override
  _shoppingPageState createState() => _shoppingPageState();
}

class _shoppingPageState extends State<shoppingPage> {
  bool _switch = false;
  double _slider = 0.3;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  int _index=0;
  void getindex ()async{
    _index = await AppModel().getSaveIndex();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getindex();
    _videoPlayerController = VideoPlayerController.network('https://media.w3.org/2010/05/sintel/trailer.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3/2,
      autoPlay: false,
      placeholder: Image.asset('images/teacher.png',fit: BoxFit.fill,),
      looping: true,
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    // TODO: implement dispose
    super.dispose();
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
            Chewie(
              controller: _chewieController,
            ),
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
//            RotatedBox(quarterTurns: 1,child: Text('hello world'),),
            Container(
              color: Colors.grey,
              width: 50,
              height: 50,
              transform: Matrix4.rotationZ(0.8),
              child: Center(child: Text('哈哈'),),
            ),
            ChoiceChip(
              label: Text('我爱你'),
              selectedColor: Colors.amber,
              disabledColor: Colors.grey,
              selected: true,
              onSelected: (value){
                setState(() {

                });
              },
            ),
            Transform.scale(
                scale: 0.8,
              child: Container(height: 50,width: 50,color: Colors.amber,),
            )



          ],
        ),
      ),
    );
  }
}