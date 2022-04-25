import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/models/topic.dart';
import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {
  final Topic t;
  const TopicItem({required this.t});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.subtitle,
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(t.txt),
        ),
      ],
    );
  }
}
