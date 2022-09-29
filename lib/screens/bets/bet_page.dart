import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/home_pages/home.dart';
import 'package:cric_dice/screens/home_pages/live.dart';
import 'package:cric_dice/screens/home_pages/recent.dart';
import 'package:cric_dice/screens/home_pages/upcoming.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class BetPage extends StatefulWidget {
  @override
  _BetPageState createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {
  final networkHandler = new NetworkHandler();
  var response;

  void getData() async {
    response = await networkHandler.get('/get_liveMatchList');
    response = response['data'];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: ShakeTransition(
            duration: Duration(milliseconds: 1600),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.diceThree,
                  size: 22.0,
                  color: theme.accentColor,
                ),
                SizedBox(width: 5.0),
                Text(
                  'Cric Dice',
                  style: theme.textTheme.headline1.copyWith(
                    color: theme.accentColor,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text(
                "Live",
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                  child: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                  child: Text(
                'Upcoming',
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                  child: Text(
                'Recent',
                style: TextStyle(color: Colors.black),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LiveMatches(),
            HomePage(),
            UpcomingMatches(),
            RecentMatches(),
          ],
        ),
      ),
    );
  }
}
