import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:magulab_flutter/widgets/request_button.dart';

class RequestProposalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("요청 조건 등록하고\n편하게 원하는 아파트 목록 받아보세요",
              style: Styles.requestPageCategoryTitle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
          child: RequestButton(),
        ),
      ],
    );
  }
}
