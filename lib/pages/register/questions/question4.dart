import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';

class Question4Page extends StatelessWidget {
  final int pageNum = 4;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 40),
          child: Text("언제 이사하길 원하시나요?", style: Styles.questionPageTitle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ],
    );
  }
}
