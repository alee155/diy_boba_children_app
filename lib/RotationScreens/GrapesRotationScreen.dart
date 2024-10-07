import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GrapesRotationScreen extends StatefulWidget {
  final List<String> selectedImageAssets;

  const GrapesRotationScreen({Key? key, required this.selectedImageAssets})
      : super(key: key);

  @override
  _GrapesRotationScreenState createState() => _GrapesRotationScreenState();
}

class _GrapesRotationScreenState extends State<GrapesRotationScreen>
    with TickerProviderStateMixin {
  late StreamSubscription<AccelerometerEvent> accelerometerSubscription;
  double _positionY = 600.0; // Initial Y position
  List<double> gravSensorVals = List.filled(3, 0.0);
  late AnimationController rotationController;
  late Animation<double> rotationAnimation;
  late AnimationController positionController;
  late AssetsAudioPlayer _audioPlayer;
  bool isPlaying = true; // Added state for play/pause button
  Color buttonColor = Colors.green;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AssetsAudioPlayer();
    _audioPlayer.open(
      Audio(
        'assets/images/music1.mp3',
        metas: Metas(
          id: 'music',
          title: 'Your Music',
          artist: 'Your Artist',
          album: 'Your Album',
          image: const MetasImage.asset('assets/images/album_cover.png'),
        ),
      ),
      loopMode: LoopMode.single,
    ); // Replace with your audio file path in the assets folder
    _audioPlayer.play();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    rotationAnimation = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(
        parent: rotationController,
        curve: Curves.linear,
      ),
    );

    positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    rotationAnimation.addListener(() {
      setState(() {});
    });

    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.forward(from: 0);
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _positionY = 150.0;
      });
      positionController.forward();
    });

    accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        gravSensorVals = lowPass(
          [event.x, event.y, event.z],
          gravSensorVals,
        );
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    accelerometerSubscription.cancel();
    rotationController.dispose();
    positionController.dispose();
    super.dispose();
  }

  void playOrPauseMusic() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
      // Dynamically change the button color based on playback state
      buttonColor = isPlaying ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    double x = gravSensorVals[1];
    double y = gravSensorVals[2];
    double degreeRotation = atan2(x, y).clamp(-pi / 2, pi / 2);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.selectedImageAssets.first,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: 10.0,
            child: Container(
              height: 35,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3.0,
                  color: const Color.fromARGB(255, 2, 53, 95),
                ),
              ),
              child: GestureDetector(
                onTap: playOrPauseMusic,
                child: CircleAvatar(
                  backgroundColor: buttonColor, // Change color dynamically
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Icon(
                        // Dynamically change the icon based on the playback state
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 10.0,
            child: Container(
              height: 35,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3.0,
                  color: const Color.fromARGB(255, 2, 53, 95),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 2, 53, 95),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 600.0, end: _positionY),
            duration: const Duration(milliseconds: 1500),
            builder: (context, double position, child) {
              return Positioned(
                top: position,
                right: 20,
                child: Transform.rotate(
                  angle: degreeRotation,
                  child: Image.asset(
                    'assets/images/img3.png',
                    width: 400.0,
                    height: 470.0,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 600.0,
            right: 280,
            child: Image.asset(
              'assets/images/leaves.png',
              width: 130.0,
            ),
          ),
        ],
      ),
    );
  }

  List<double> lowPass(List<double> input, List<double> output) {
    if (output == null) return input;

    for (int i = 0; i < input.length; i++) {
      output[i] = output[i] + 0.15 * (input[i] - output[i]);
    }
    return output;
  }
}
