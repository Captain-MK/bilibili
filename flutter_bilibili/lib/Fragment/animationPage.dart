import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class animationPage extends StatefulWidget {
  @override
  _animationPageState createState() => _animationPageState();
}

class _animationPageState extends State<animationPage>  with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this,debugLabel: '我爱你');
    animation = new Tween(begin: 5.0, end: 255.0).animate(controller)..addStatusListener((status){
      print('${status}');
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
//      ..addListener(() {
//        setState(() {
//          // the state that has changed here is the animation object’s value
//        });
//      });
    controller.forward();//开始动画
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),

      body:AnimatedLogo(animation: animation,),


//      body: new Center(
//        child: new Container(
//          height: animation.value,
//          width: animation.value,
//          child: new FlutterLogo(),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(40.0),
//            color: Color.fromARGB(255, animation.value.toInt(), 155, 0),
//          ),
//        ),
//      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}


class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Color.fromARGB(255, animation.value.toInt(), 155, 0),
        ),
      ),
    );
  }
}
