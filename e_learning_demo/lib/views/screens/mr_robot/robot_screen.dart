import 'dart:async';

import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/models/robowords.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rive/rive.dart';

enum TtsState { playing, stopped, paused, continued }

class Robot extends StatefulWidget {
  final String word;
  const Robot({Key? key, required this.word}) : super(key: key);

  @override
  State<Robot> createState() => _RobotState();
}

class _RobotState extends State<Robot> {
  SwiperController swiperController = SwiperController();
  int phController = 0;
  List<String>? robotPhrases;
  final FlutterTts flutterTts = FlutterTts();

  bool get isPlaying => controller?.isActive ?? true;
  // animations
  Artboard? _riveArtboard;
  StateMachineController? controller;
  SMIInput<double>? levelInput;

  @override
  void initState() {
    //words to speech
    RoboWords r = RoboWords(words: widget.word);
    robotPhrases = r.getwordslist();

    flutterTts.setPitch(1);
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.25);
    flutterTts.setVolume(1.0);
    flutterTts.speak(robotPhrases![0]);
// rive animation init
    rootBundle.load("assets/rivs/RF.riv").then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (controller != null) {
          artboard.addController(controller!);
          levelInput = controller!.findInput('Number 1');
          levelInput?.value = 2;
        }
        setState(() => _riveArtboard = artboard);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: _riveArtboard == null
                  ? const SizedBox()
                  : Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Positioned.fill(
                          child: Rive(
                            artboard: _riveArtboard!,
                          ),
                        ),
                      ],
                    ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
            )),
        Container(
          height: SizeConfig.height! / 1.8,
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Swiper(
              onIndexChanged: (v) {
                controller!.isActive = true;
                if (robotPhrases![v].contains("?"))
                  levelInput!.value = 2;
                else
                  levelInput!.value = 1;

                flutterTts.speak(robotPhrases![v]);
                Timer(
                    Duration(
                        seconds: (robotPhrases![v].split(" ").length / 2.2)
                            .ceil()), () {
                  controller!.isActive = false;
                });
              },
              scrollDirection: Axis.vertical,
              itemCount: robotPhrases!.length,
              containerHeight: SizeConfig.height! / 4,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AColors.instagramColors[i % 5].withOpacity(0.6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    robotPhrases![i],
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue.shade900,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              blurRadius: 40,
                              offset: Offset(0, 10))
                        ]),
                  ),
                );
              },
            ),
          ),
        ),
        //control units
      ],
    ));
  }

  finishTalking(String word) {
    int c = word.split(" ").length;
    if (c < 10)
      return 5;
    else if (c < 20) return 10;
  }
}
