import 'package:flutter/material.dart';
import 'package:flutter_os/screens/name_screen.dart';
import 'package:flutter_os/utils.dart';
import 'package:wear/wear.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: FlutterLogo(size: 90),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    highlightColor: Colors.blue[900],
                    elevation: 6.0,
                    child: Text(
                      'START',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return NameScreen(screenHeight, screenWidth);
                      }));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}