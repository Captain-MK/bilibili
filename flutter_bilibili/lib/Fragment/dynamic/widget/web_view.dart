import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
const CATCH_URLS = ['m.ctrip.com/','m.ctrip.com/html5/','m.ctrip.com/html5'];//白名单
class WebView extends StatefulWidget {
  final String statusBarColor;
  final String icon;
  final String title;
  final String url;
  final bool hideAppBar;
//  final DynamicModelLocalnavlist model;
  final bool backForbid;

  const WebView({Key key, this.statusBarColor, this.icon = '', this.title, this.url, this.hideAppBar = false, this.backForbid = false}) : super(key: key);//是否禁止返回
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  bool exiting = false;
  @override
  void initState() {
    super.initState();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {

    });
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state){
      switch(state.type){
        case WebViewState.shouldStart:
          // TODO: Handle this case.
          if(_isToMain(state.url) && !exiting){
            if(widget.backForbid){
              flutterWebviewPlugin.launch(widget.url);
            }else{
              Navigator.pop(context);
              exiting = true;
            }
          }
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
  _isToMain(String url){
    bool contain = false;
    for(final value in CATCH_URLS){
      if(url?.endsWith(value)??false){
        contain = true;
        break;
      }
    }
    return contain;
  }
  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String StateBackColor = widget.statusBarColor ?? 'ffffff';
    Color backBtnColor;
    if(StateBackColor=='ffffff'){
      backBtnColor = Colors.black;
    }else{
      backBtnColor = Colors.white;
    }
    return Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              _appBar(Color(int.parse('0xff'+StateBackColor)),backBtnColor),
              Expanded(
                child: WebviewScaffold(
                  url: widget.url,
                  withZoom: true,//缩放
                  withLocalStorage: true,//本地缓存
                  hidden: true,//加载未出来之前 隐藏
//                  initialChild: Container(//暂时不可以
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Text('Loadding...'),
//                        CircularProgressIndicator(),
//                      ],
//                    ),
//                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
  Widget _appBar(Color backColor,Color backBtnColor){
      if(widget.hideAppBar){
        return Container(
          color: backColor,
          height: 30.0,
        );
      } else{
        return Container(
          color: backColor,
          padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          child: FractionallySizedBox(//可以撑满宽度
            widthFactor: 1.0,//让Stack宽度撑满
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.close,color: backBtnColor,size: 26.0,),
                  ),
                  onTap: (){
                    flutterWebviewPlugin.close();
                    Navigator.pop(context);
                    },
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  child: Center(child: Text(widget.title!=null?widget.title:'',style: TextStyle(color: backBtnColor,fontSize: 20.0),),),
                ),
              ],
            ),
          ),
        );
      }
  }
}
