import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magulab_flutter/models/match.dart';
import 'package:magulab_flutter/pages/home/viewmodel/home_viewmodel.dart';
import 'package:magulab_flutter/styles.dart';
import 'package:magulab_flutter/widgets/match_card.dart';
import 'package:provider/provider.dart';

class ResponsePage extends StatelessWidget {
  Widget _generateHeadlineRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("집사에서 집 사자!", style: Styles.responsePageHeadlineDescription),
          Text("집사", style: Styles.responsePageHeadlineTitle),
        ],
      ),
    );
  }

  Widget _generateRequestRow(Match match) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: MatchCard(match));
  }

  ListView list(List<Match> matches) {
    return ListView.builder(
      itemCount: matches.length + 1,
      itemBuilder: (context, index) {
        if (index <= 0) {
          return _generateHeadlineRow();
        } else if (index > 0) {
          return _generateRequestRow(matches[index - 1]);
        }
      },
    );
  }

  FutureBuilder futureBuilder(BuildContext context) {
    return FutureBuilder<List<Match>>(
      future: Provider.of<HomeResponseViewModel>(context).getMatches(),
      builder: (context, AsyncSnapshot<List<Match>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.error == null &&
            snapshot.hasData) {
          List<Match> matches = snapshot.data;
          return CupertinoTabView(
            builder: (context) {
              return list(matches);
            },
          );
        }
        return list(List());
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
