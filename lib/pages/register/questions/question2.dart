import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:magulab_flutter/widgets/register_text_button.dart';

class Question2Page extends StatelessWidget {
  final int pageNum = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 40),
          child: Text("거래조건을 선택해 주세요.", style: Styles.questionPageTitle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RegisterTextButton("매매"),
            RegisterTextButton("전세"),
            RegisterTextButton("월세"),
          ],
        ),
      ],
    );
  }
}
