import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';

class Question5Page extends StatelessWidget {
  final int pageNum = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 40),
          child: Text("공통 조건 선택이 완료되었습니다. 지금부터 아파트별 세부 조건 선택이 시작됩니다.",
              style: Styles.questionPageTitle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ],
    );
  }
}
