import 'package:flutter/material.dart';
import 'package:magulab_flutter/models/request.dart';
import 'package:magulab_flutter/styles.dart';

class RequestWidget extends StatelessWidget {
  final Map<int, Request> requestMap;

  const RequestWidget({this.requestMap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("공통 조건", style: Styles.requestPageCategoryTitle),
        ),
        Container(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("35평, 월세, 보증금 9000만원, 월세 100만원, 올인테리어, 남향,1~12층, 역세권",
              style: Styles.requestPageCategoryDescription),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("20.02.17 - 20.02.25 이사",
              style: Styles.requestPageCategoryDescription),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("전세대출동의", style: Styles.requestPageCategoryDescription),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Container(
            height: 1,
            color: Color.fromRGBO(196, 196, 196, 0.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("상세 조건(${requestMap[0].apartName})",
              style: Styles.requestPageCategoryTitle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text("25평 A/B/C, 34평, 3-11층",
              style: Styles.requestPageCategoryDescription),
        ),
      ],
    );
  }
}
