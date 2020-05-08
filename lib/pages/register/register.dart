import 'package:flutter/material.dart';
import 'package:magulab_flutter/pages/register/questions/question1.dart';
import 'package:magulab_flutter/pages/register/questions/question2.dart';
import 'package:magulab_flutter/pages/register/questions/question3.dart';
import 'package:magulab_flutter/pages/register/questions/question4.dart';
import 'package:magulab_flutter/pages/register/questions/question5.dart';
import 'package:magulab_flutter/pages/register/viewmodel/registrer_viewmodel.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  Widget head(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("요청하기", style: Styles.registerPageHeadNormalTitle),
                  Container(width: 17),
                  Text("공통 조건", style: Styles.registerPageHeadBoldTitle),
                ],
              )),
          Consumer<RegisterViewModel>(builder: (context, viewModel, child) {
            return LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              animation: false,
              lineHeight: 5.0,
              percent: viewModel.percent,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.black,
              backgroundColor: Color.fromRGBO(247, 247, 247, 1.0),
            );
          }),
        ]),
      ],
    );
  }

  Widget bottom(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, viewModel, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
            visible:
                viewModel.currentPageNum > RegisterViewModel.FIRST_PAGE_NUM,
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(16, 25, 16, 25),
              child: Text("< 이전", style: Styles.registerPageBottomNormalTitle),
              onPressed: () => viewModel.movePreviousPage(),
            ),
          ),
          Visibility(
            visible:
                viewModel.currentPageNum < RegisterViewModel.MAX_PAGE_NUM + 1,
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(16, 25, 16, 25),
              child: Text("다음 >", style: Styles.registerPageBottomNormalTitle),
              onPressed: () => viewModel.moveNextPage(),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(RegisterViewModel.FIRST_PAGE_NUM),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child:
            Consumer<RegisterViewModel>(builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              head(context),
              Expanded(
                child: moveQuestionPage(viewModel.currentPageNum),
              ),
              bottom(context),
            ],
          );
        }),
      ),
    );
  }

  Widget moveQuestionPage(int pageNum) {
    switch (pageNum) {
      case 1:
        return Question1Page();
      case 2:
        return Question2Page();
      case 3:
        return Question3Page();
      case 4:
        return Question4Page();
      case 5:
        return Question5Page();
      default:
        return Question5Page();
    }
  }
}
