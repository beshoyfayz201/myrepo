import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/models/robowords.dart';
import 'package:e_learning_demo/views/screens/algorithm/algorithm_widgets/sub_category.dart';
import 'package:e_learning_demo/views/screens/exam_screen/exam_screen.dart';
import 'package:e_learning_demo/views/screens/mr_robot/robot_screen.dart';
import 'package:flutter/material.dart';

import '../alg_main_screen.dart';

class CategoryItem extends StatefulWidget {
  final int i;
  final Algorithm a;

  CategoryItem({Key? key, required this.a, required this.i}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 500),
      dividerColor: Colors.green,
      expandedHeaderPadding: EdgeInsets.only(bottom: 5.0),
      expansionCallback: (i, b) {
        setState(() {
          state = !b;
        });
      },
      elevation: 0,
      children: [
        ExpansionPanel(
          backgroundColor: Colors.grey.shade100,
          isExpanded: state,
          body: SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  child: SubCategory(
                      color: AColors.lightGreen,
                      img: "assets/images/c1.png",
                      goTo: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => AlgorithmScreen(
                                  algorithm: widget.a,
                                )));
                      },
                      txt: "Learn"),
                ),
                Expanded(
                  child: SubCategory(
                      color: AColors.yellow,
                      img: "assets/images/c3.png",
                      goTo: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => ExamScreen(
                                  exam: widget.a.examModel,
                                )));
                      },
                      txt: "practise"),
                ),
                Expanded(
                  child: SubCategory(
                      color: AColors.orange,
                      img: "assets/images/c2.png",
                      goTo: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) => Robot()));
                      },
                      txt: "Play"),
                ),
              ],
            ),
          ),
          headerBuilder: (ctx, i) => ListTile(
            title: Text(
              widget.a.title,
              style:
                  TextStyle(color: Colors.white, fontFamily: 'b', fontSize: 40),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: AColors.category_colors[widget.i % 3],
            isThreeLine: true,
            subtitle: Text(
              widget.a.intro,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade100),
            ),
            trailing: Transform.rotate(
              angle: 10,
              child: Image.asset("assets/images/cat.png"),
            ),
          ),
        )
      ],
    );
  }
}
