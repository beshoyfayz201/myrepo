import 'package:e_learning_demo/control/monitor.dart';
import 'package:e_learning_demo/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicNote extends StatefulWidget {
  final Topic t;
  TopicNote({required this.t});

  @override
  _TopicNoteState createState() => _TopicNoteState();
}

class _TopicNoteState extends State<TopicNote> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    Monitor monitor = Provider.of<Monitor>(context, listen: false);
    return ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),
        dividerColor: Colors.blue.shade100,
        expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
        expansionCallback: (i, b) {
          monitor.addEvent("main point opened @ ${DateTime.now()}");
          setState(() {
            state = !b;
          });
        },
        elevation: 1,
        children: [
          ExpansionPanel(
              isExpanded: state,
              headerBuilder: (ctx, i) {
                return Center(
                    child: Text(
                  widget.t.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontFamily: "b", fontSize: 40),
                ));
              },
              body: Container(
                  padding: EdgeInsets.all(8), child: Text(widget.t.txt)))
        ]);
  }
}
