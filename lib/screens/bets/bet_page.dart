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
  final List _matches = [];
  final _channel = WebSocketChannel.connect(
    // Uri.parse('wss://cric-dice-api-dev.herokuapp.com'),
    Uri.parse('wss://cric-dice-api.herokuapp.com'),

  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
      ),
      body: Container(
          child: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _matches = jsonDecode(snapshot.data);
            return ListView.builder(
                itemCount: int.parse('${_matches.length}'),
                itemBuilder: (BuildContext context, int index) {
                  if (_matches[index]["matchInfo"]["Status"] == "") {
                    final st = DateTime.parse(
                        _matches[index]["matchInfo"]["StartTime"]);
                    _matches[index]["matchInfo"]["Status"] =
                        DateFormat('EEE d MMM, hh:mm').format(st);
                  }
                  return Column(
                    children: [
                      ShakeListTransition(
                        duration: Duration(milliseconds: 1600),
                        child: BetCard(
                          matchType: _matches[index]["matchInfo"]["MatchType"]
                              .toString(),
                          team:
                              _matches[index]["matchInfo"]["Teams"].toString(),
                          price: '20',
                          volume:
                              _matches[index]["matchInfo"]["Volume"].toString(),
                          status:
                              _matches[index]["matchInfo"]["Status"].toString(),
                          fullData: _matches[index],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
