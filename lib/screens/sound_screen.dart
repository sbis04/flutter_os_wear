import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

const img = 'assets/images/';

class PlayRoute extends StatefulWidget {
  final String sound;
  const PlayRoute({Key key, this.sound}) : super(key: key);
  @override
  _PlayRouteState createState() => _PlayRouteState();
}

class _PlayRouteState extends State<PlayRoute> {
  AudioPlayer player;
  AudioCache cache;
  bool initialPlay = true;
  bool playing;

  @override
  initState() {
    super.initState();
    player = new AudioPlayer();
    cache = new AudioCache(fixedPlayer: player);
  }

  @override
  dispose() {
    super.dispose();
    player.stop();
  }

  playPause(sound) {
    if (initialPlay) {
      cache.play('audio/$sound.mp3');
      playing = true;
      initialPlay = false;
    }
    return InkWell(
      onTap: () {
        setState(() {
          if (playing) {
            playing = false;
            player.pause();
          } else {
            playing = true;
            player.resume();
          }
        });
      },
      child: playing
          ? Image.asset('assets/pause_circle_filled.png', scale: 1.2)
          : Image.asset('assets/play_circle_filled.png', scale: 1.2),
    );
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Background(sound: widget.sound),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/outline_arrow_back_white.png',
                    scale: 1.8,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.sound.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 10.0,
                      fontWeight: FontWeight.w600),
                ),
                playPause(widget.sound)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatefulWidget {
  final String sound;
  const Background({Key key, this.sound}) : super(key: key);
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  Timer timer;
  bool _visible = false;

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  swap() {
    if (mounted) {
      setState(() {
        _visible = !_visible;
      });
    }
  }

  @override
  build(BuildContext context) {
    timer = Timer(Duration(seconds: 6), swap);
    return Stack(
      children: [
        Image.asset(img + widget.sound + '_1.jpg', fit: BoxFit.fill),
        AnimatedOpacity(
            child: Image.asset(
              img + widget.sound + '_2.jpg',
              fit: BoxFit.fill,
            ),
            duration: Duration(seconds: 2),
            opacity: _visible ? 1.0 : 0.0)
      ],
    );
  }
}
