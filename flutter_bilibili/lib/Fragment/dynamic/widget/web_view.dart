import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class WebView extends StatefulWidget {
  final DynamicModelLocalnavlist model;

  const WebView({Key key, this.model}) : super(key: key);
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {

    });
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state){
      switch(state.type){
        case WebViewState.shouldStart:
          // TODO: Handle this case.
          break;
        case WebViewState.startLoad:
          // TODO: Handle this case.
          break;
        case WebViewState.finishLoad:
          // TODO: Handle this case.
          break;
        case WebViewState.abortLoad:
          // TODO: Handle this case.
          break;
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
  }
  @override
  Widget build(BuildContext context) {
    String StateBackColor = widget.model.statusBarColor ?? 'ffffff';
    Color backBtnColor;
    if(StateBackColor=='ffffff'){
      backBtnColor = Colors.black;
    }else{
      backBtnColor = Colors.white;
    }
    return Scaffold(
        body: Column(
          children: <Widget>[
            _appBar(Color(int.parse('0xff'+StateBackColor)),backBtnColor),
            Expanded(
              child: WebviewScaffold(
                url: widget.model.url,
                withZoom: true,//缩放
                withLocalStorage: true,//本地缓存
                hidden: true,//加载未出来之前 隐藏
                initialChild: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Loadding...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
  Widget _appBar(Color backColor,Color backBtnColor){
      if(widget.model.hideAppBar){
        return Container(
          color: backColor,
          height: 30.0,
        );
      } else{
        return FractionallySizedBox(//可以撑满宽度
          widthFactor: 1.0,//让Stack宽度撑满
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.close,color: backBtnColor,size: 26.0,),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                child: Center(child: Text(widget.model.title!=null?widget.model.title:'',style: TextStyle(color: backBtnColor,fontSize: 20.0),),),
              ),
            ],
          ),
        );
      }
  }
}
