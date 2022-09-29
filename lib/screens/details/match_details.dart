import 'package:cric_dice/screens/match_details/match_fancy.dart';
import 'package:cric_dice/screens/match_details/Scorecard.dart';
import 'package:cric_dice/screens/match_details/match_history.dart';
import 'package:cric_dice/screens/match_details/match_info.dart';
import 'package:cric_dice/screens/match_details/poins_table.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatelessWidget {
  final data;

  MatchDetails({this.data});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 3,
            title: ShakeTransition(
              duration: Duration(milliseconds: 1600),
              child: Row(
                children: [
                  Text(
                    data['team_a_short'] + ' Vs ' + data['team_b_short'],
                    style: theme.textTheme.headline1
                        .copyWith(color: theme.primaryColor),
                  ),
                ],
              ),
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                    child: Text(
                  'Info',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'Match Fancy',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'Match Odd History',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'Scorecard',
                  style: TextStyle(color: Colors.black),
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MatchInfo(id: data['match_id']),
              Fantasy(id: data['match_id']),
              MatchOddHistory(id: data['match_id']),
              Scorecard(id: data['match_id']),
            ],
          ),
        ));
  }
}
