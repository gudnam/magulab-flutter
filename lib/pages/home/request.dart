import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magulab_flutter/models/request.dart';
import 'package:magulab_flutter/pages/home/viewmodel/home_viewmodel.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:magulab_flutter/widgets/request_widget.dart';
import 'package:magulab_flutter/widgets/request_proposal_widget.dart';
import 'package:provider/provider.dart';

class RequestPage extends StatelessWidget {
  Column headline(BuildContext context, String headText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Text(headText, style: Styles.requestPageHeadlineTitle),
        ),
        Container(
          height: 86,
        ),
      ],
    );
  }

  Column body(BuildContext context, Map<int, Request> requestMap) {
    requestMap ??= Map();
    if (requestMap.length > 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headline(context, "이런 집을\n원해요!"),
          RequestWidget(requestMap: requestMap),
        ],
      );
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          headline(context, "아직 요청한게\n없으시네요 :)"),
          Expanded(
            child: RequestProposalWidget(),
          ),
        ],
      );
  }

  FutureBuilder futureBuilder(BuildContext context) {
    return FutureBuilder<Map<int, Request>>(
      future: Provider.of<HomeRequestViewModel>(context).getRequestMap(),
      builder: (context, AsyncSnapshot<Map<int, Request>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null)
            return headline(context, "요청 내역을 불러오는데 실패하였습니다!");
          if (!snapshot.hasData) return body(context, null);
          Map<int, Request> requestMap = snapshot.data;
          requestMap = Map();
          return body(context, requestMap);
        }
        return headline(context, "이런 집을\n원해요!");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: futureBuilder(context),
    );
  }
}
