import 'package:flutter/material.dart';

class AmbientWatchFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FlutterOS',
                style: TextStyle(color: Colors.blue[600], fontSize: 30),
              ),
              SizedBox(height: 15),
              const FlutterLogo(size: 60.0),
            ],
          ),
        ),
      );
}