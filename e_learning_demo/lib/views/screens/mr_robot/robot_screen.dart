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
  const Robot({Key? key}) : super(key: key);

  @override
  State<Robot> createState() => _RobotState();
}

class _RobotState extends State<Robot> {
  SwiperControl s = SwiperControl();

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
    RoboWords r = RoboWords(
        words:
            " hiiiiiii. im mr robot and im here to read books for you. when ready slide smothely at the bottom up and down to read paragaphs \n ,We'll go through the steps of building a Hoffman tree. get ready\n   As we mentioned the input is a set of unique characters along with their frequency of occurrence and the output is Huffman Tree.\n   first : Create a leaf node for each unique character and build a small heap of all the leaf nodes (Min Heap is used as a priority queue. \n The value of the Frequency field is used to compare two nodes in the minimum heap. Initially, the least frequent character is in the root) \n second : Extract two nodes with minimum frequency from the minimum heap.\n   third  :Create a new internal node with a frequency equal to the sum of the frequencies of the two nodes.\n   Make the first extracted node as its left child node and the other extracted node as its child \n node.  Add this knot to the smaller pile.  Fourthly : Repeat steps 2 and 3 until the pile contains only one node.  The remaining node is the root node and the tree is complete.  Watch now and learn:");
    robotPhrases = r.getwordslist();

    flutterTts.setPitch(1.5);
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.25);
    flutterTts.setVolume(10);
    flutterTts.speak(robotPhrases![0]);
// rive animation init
    rootBundle.load("assets/rivs/robo.riv").then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        controller =
            StateMachineController.fromArtboard(artboard, 'State Machine');
        if (controller != null) {
          artboard.addController(controller!);
          levelInput = controller!.findInput('Number 1');
          levelInput?.value = 1;
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
          height: SizeConfig.height! / 2,
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Swiper(
              onIndexChanged: (v) {
                controller!.isActive = true;
                flutterTts.speak(robotPhrases![v]);
                Timer(Duration(seconds: 10), () {
                  controller!.isActive = false;
                });
              },
              control: s,
              scrollDirection: Axis.vertical,
              itemCount: robotPhrases!.length,
              containerHeight: SizeConfig.height! / 4,
              autoplayDelay: 10000,
              itemBuilder: (context, i) {
                phController = i;
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
}
