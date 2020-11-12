import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/flask.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/flask.png",
              width: size.width * 0.5,
            ),
          ),
          Positioned(
                width: MediaQuery.of(context).size.width,//TRY TO CHANGE THIS **0.30** value to achieve your goal 
                child: Container(
                  margin: EdgeInsets.all(8),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/flask.png', scale: 1.5)
                      ]
                  ),
                )),
          child,
        ],
      ),
    );
  }
}
