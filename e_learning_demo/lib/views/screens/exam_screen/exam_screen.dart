import 'dart:async';

import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/models/exam_model.dart';
import 'package:e_learning_demo/models/topic.dart';
import 'package:e_learning_demo/views/screens/algorithm/algorithm_widgets/topic_note.dart';
import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  ExamModel exam;
  ExamScreen({required this.exam});
  static const String id = "ExamScreen";

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsedTime = "00 : 00 : 00";
  @override
  void dispose() {
    timer!.cancel();
    stopwatch.stop();
    
    super.dispose();
  }

  @override
  void initState() {
    stopwatch.start();
    timer = new Timer.periodic(Duration(milliseconds: 100), updateTime);
    Timer.periodic(Duration(minutes: 20), (t) {
      showDialog(
          context: context,
          builder: (context) {
            t.cancel();
            return AlertDialogMessage(timeEnd: true, res: calculatedResult());
          });
    });

    super.initState();
  }

  transformMilliSeconds(int i) {
    int hundreds = (i / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = ((minutes % 60).toString().padLeft(2, "0"));
    String secondsStr = ((seconds % 60).toString().padLeft(2, "0"));
    String hundredsStr = ((hundreds % 100).toString().padLeft(2, "0"));

    return "$minutesStr : $secondsStr : $hundredsStr";
  }

  updateTime(Timer timer) {
    if (stopwatch.isRunning) {
      var milliseconds = stopwatch.elapsedMilliseconds;
      int hundreds = (milliseconds / 10).truncate();
      int seconds = (hundreds / 100).truncate();
      int minutes = (seconds / 60).truncate();
      setState(() {
        elapsedTime = transformMilliSeconds(stopwatch.elapsedMilliseconds);
        if (seconds > 59) {
          seconds = seconds - (59 * minutes);
          seconds = seconds - minutes;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Text(
                  "ALPHA",
                  style: TextStyle(
                      color: AColors.prime, fontFamily: "b", fontSize: 40),
                ),
                Spacer(),
                Text(
                  "Time elapsed : ${elapsedTime}",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            )),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cat.png",
                    ),
                    fit: BoxFit.fill)),
            child: ListView(children: [
              TopicNote(
                  t: Topic(
                      subtitle: "instructions :",
                      txt:
                          "This quiz consists of 20 multiple-choice questions. To be successful with the  quizzes, it’s important to thoroughly read each chapter  carefully a in the algorithm.  It will also be extremely useful to study the key points at the end of the chapter and review the Test Your Knowledge activity at the end of the chapter")),
              ...List.generate(
                  20,
                  (i) => Card(
                        color: Colors.grey.shade200.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                widget.exam.quests[i].q,
                                style: TextStyle(fontSize: 20),
                              ),
                              Column(
                                children: widget.exam.quests[i].answers
                                    .map((e) => RadioListTile<int>(
                                          onChanged: (choice) {
                                            setState(() {
                                              widget.exam.score![i] = choice!;
                                            });
                                          },
                                          title: Text(e),
                                          value: widget.exam.quests[i].answers
                                              .indexOf(e),
                                          groupValue: widget.exam.score![i],
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      )),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialogMessage(
                            timeEnd: false, res: calculatedResult()));
                  },
                  child: Text("Submit"))
            ])));
  }

  int calculatedResult() {
    stopwatch.stop();
    timer!.cancel();
    int res = 0;
    for (int i = 0; i < 20; i++) {
      if (widget.exam.score![i] == widget.exam.quests[i].ansIndex) res++;
    }
    return res;
  }
}

class AlertDialogMessage extends StatelessWidget {
  bool timeEnd;
  int res;
  AlertDialogMessage({required this.timeEnd, required this.res});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(timeEnd ? "time is gone" : "result"),
      content: Text("you got$res /20"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text("OK"))
      ],
    );
  }
}
