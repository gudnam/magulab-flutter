import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';

class Question3Page extends StatelessWidget {
  final int pageNum = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 40),
          child: Text("원하는 금액대를 선택해 주세요.", style: Styles.questionPageTitle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ],
    );
  }
}
