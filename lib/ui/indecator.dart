import 'package:flutter/material.dart';

const TWO_PI = 3.14 * 2;

class Indecator extends StatelessWidget {
  final size;
  double beginvalue;
  double endValue;
  Indecator({this.size,this.beginvalue,this.endValue});
  @override
  Widget build(BuildContext context) {
    //final size =ssize;
    return SafeArea(
      child: Scaffold(
        body:Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: beginvalue,end:endValue),
            duration: Duration(seconds: 5),
            builder: (context,value,child){
              int percentage = (value*100).ceil();
              return Container(
                width: size,
                height: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect){
                        return SweepGradient(
                            startAngle: 0.0,
                            endAngle: TWO_PI,
                            stops: [value,value],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: [Colors.blue,Colors.grey.withAlpha(55)]
                        ).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                         //  image: DecorationImage(image: Image.asset("assets/images/radial_scale.png").image)
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size-10,
                        height: size-10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("$percentage",
                          style: TextStyle(fontSize: size*0.4),)),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}