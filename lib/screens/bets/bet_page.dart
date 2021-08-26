import 'package:cric_dice/screens/bets/bet_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:expandable/expandable.dart';

class BetPage extends StatefulWidget {
  @override
  _BetPageState createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {
  final List _matches = [];
  final _channel = WebSocketChannel.connect(
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
                color: theme.primaryColor,
              ),
              SizedBox(width: 5.0),
              Text(
                'Cric Dice',
                style: theme.textTheme.headline1.copyWith(
                  color: theme.primaryColor,
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
            final dataObj = jsonDecode(snapshot.data);
            final idx = _matches.indexWhere(
              (elem) =>
                  elem['matchInfo']['MatchId'] == dataObj['data']['MatchId'],
            );
            if (idx == -1) {
              if (dataObj['responseType'] == 4) {
                _matches.add({'matchInfo': dataObj['data']});
              }
            } else {
              switch (dataObj['responseType']) {
                case 4:
                  _matches[idx]['matchInfo'] = dataObj['data'];
                  break;

                case 5:
                  _matches[idx]['odiScore'] = dataObj['data'];
                  break;

                case 6:
                  if (_matches[idx]['testScore'] ?? [].length != 0) {
                    final teamIdx = _matches[idx]['testScore'].indexWhere(
                      (elem) => elem['Name'] == dataObj['data']['Name'],
                    );
                    if (teamIdx == -1) {
                      _matches[idx]['testScore'].add(dataObj['data']);
                    }
                  } else {
                    _matches[idx]['testScore'] = [dataObj['data']];
                  }
                  break;

                case 7:
                  _matches[idx]['overRuns'] = dataObj['data'];
                  break;

                case 8:
                  _matches[idx]['liveCommentry'] = dataObj['data'];
                  break;

                case 9:
                  _matches[idx]['marketRateInfo'] = dataObj['data'];
                  break;

                case 10:
                  _matches[idx]['marketRate'] = dataObj['data'];
                  break;

                case 11:
                  _matches[idx]['session'] = dataObj['data'];
                  break;
              }
            }
            print(dataObj['responseType']);

            return ListView.builder(
                itemCount: int.parse('${_matches.length}'),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ShakeListTransition(
                        duration: Duration(milliseconds: 1600),
                        child: ExpandablePanel(
                          // header: Text(article.title),
                          collapsed: BetCard(
                            matchType: _matches[index]["matchInfo"]["MatchType"]
                                .toString(),
                            team: _matches[index]["matchInfo"]["Teams"]
                                .toString(),
                            price: '20',
                            volume: _matches[index]["matchInfo"]["Volume"]
                                .toString(),
                            status: _matches[index]["matchInfo"]["Status"]
                                .toString(),
                            // onTap: () {
                            //   Get.to(() => BetDetails(
                            //         matchData: _matches[index],
                            //       ));
                            // },
                          ),
                          expanded: Text(
                            _matches[index].toString(),
                            softWrap: true,
                          ),
                          // tapHeaderToExpand: true,
                          // hasIcon: true,
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
