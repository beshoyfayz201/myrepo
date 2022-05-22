import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/control/monitor.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/models/question.dart';
import 'package:e_learning_demo/views/main_widgets/form_background.dart';
import 'package:e_learning_demo/views/screens/algorithm/algorithm_widgets/monitor_widget.dart';
import 'algorithm_widgets/topic_note.dart';
import 'algorithm_widgets/topic_ui.dart';
//
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class AlgorithmScreen extends StatefulWidget {
  static const id = "AlgorithmScreen";
  Algorithm algorithm;

  AlgorithmScreen({required this.algorithm});
  @override
  _AlgorithmScreenState createState() => _AlgorithmScreenState();
}

class _AlgorithmScreenState extends State<AlgorithmScreen> {
  int questionIterator = 0;
  //
//animation var
  bool get isPlaying => controller?.isActive ?? false;
  Artboard? _riveArtboard;
  StateMachineController? controller;
  SMIInput<double>? levelInput;
//monitor vars
  ScrollController? sc = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load(widget.algorithm.path).then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (controller != null) {
          artboard.addController(controller!);
          levelInput = controller!.findInput('n');
          levelInput?.value = 0;
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Monitor monitor = Provider.of<Monitor>(context, listen: false);

    return Scaffold(
        body: TopMonitorWidget(
      title: widget.algorithm.title,
      child: FormBackground(
        //title
        title: "Alpha",
        imagePath: "assets/images/back.jpg",
        graidentColor: AColors.shine_blue,
        //real body
        child: GestureDetector(
          onVerticalDragDown: (d) {
            monitor.addEvent(
                "${d.globalPosition} at${DateTime.now()}${sc!.position}\n\n");
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              controller: sc,
              children: [
                Text(
                  widget.algorithm.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.algorithm.intro),
                ),
                TopicItem(t: widget.algorithm.topics[0]),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        child: const Text('prev'),
                        onPressed: () {
                          monitor.addEvent("prev pressed @${DateTime.now()}\n");

                          if (!controller!.isActive) {
                            if (levelInput?.value != 0) levelInput?.value -= 1;
                          }
                          print("step num :${levelInput?.value}");
                        }),
                    ElevatedButton(
                        child: const Text('Next'),
                        onPressed: () {
                          monitor.addEvent("next pressed @${DateTime.now()}\n");
                          if (!controller!.isActive) {
                            if (levelInput?.value != widget.algorithm.last) {
                              if (widget.algorithm.stops
                                  .contains(levelInput?.value))
                                buildQuestionWidget(
                                    context,
                                    widget.algorithm.quests[widget
                                        .algorithm.stops
                                        .indexOf(levelInput!.value.toInt())]);
                              else
                                levelInput?.value += 1;
                              print("step= ${levelInput?.value}");
                            }
                          } else
                            print("loadingggggggggggggggggg");
                        }),
                  ],
                ),
                //change this to be reactive+++++++++++++++++++
                TopicNote(
                  t: widget.algorithm.mainNotes[0],
                ),
                SizedBox(
                  height: SizeConfig.defaultsize,
                ),
                TopicNote(
                  t: widget.algorithm.mainNotes[1],
                ),
                SizedBox(
                  height: SizeConfig.defaultsize,
                ),

                TopicItem(t: widget.algorithm.topics[1]),

                ElevatedButton(
                    onPressed: () {
                      print(monitor.actions);
                      Navigator.pop(context);
                    },
                    child: Text("get back to home"))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  buildQuestionWidget(
    BuildContext context,
    Question q,
  ) {
    AlertDialog qDialog = AlertDialog(
      alignment: Alignment.bottomRight,
      content: Text(q.q),
      actionsAlignment: MainAxisAlignment.center,
      title: Text("quiz"),
      actions: q.answers
          .map((e) => ElevatedButton(
              onPressed: () {
                if (q.ansIndex == q.answers.indexOf(e)) {
                  Navigator.pop(context);
                  levelInput?.value++;
                } else {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text("Worng answer"),
                            content: Text("Hint : " + q.why),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    levelInput?.value--;
                                  },
                                  child: Text("let’s try again"))
                            ],
                          ));
                }
              },
              child: Text(e)))
          .toList(),
    );
    showDialog(
        context: context,
        builder: (ctx) => qDialog,
        barrierDismissible: false,
        barrierColor: Colors.transparent);
    AlertDialog doneDialog;
    AlertDialog wrongDialog;
  }
}
