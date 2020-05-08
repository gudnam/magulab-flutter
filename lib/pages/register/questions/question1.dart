import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:magulab_flutter/widgets/register_text_button.dart';

class Question1Page extends StatelessWidget {
  final int pageNum = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 40),
          child: Text("어떤 아파트를 원하세요?", style: Styles.questionPageTitle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RegisterTextButton("잠실 엘스"),
            RegisterTextButton("잠실 리센츠"),
            RegisterTextButton("잠실 트리지움"),
          ],
        ),
      ],
    );
  }
}
