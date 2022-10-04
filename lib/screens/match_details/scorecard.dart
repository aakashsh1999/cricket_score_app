import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widget_score_card.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scorecard extends StatefulWidget {
  final id;

  Scorecard({this.id});

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {
  final networkHandler = new NetworkHandler();
  var response;
  var result;
  var teamA;
  var teamB;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getById('/get_scorecard', widget.id);
    isLoading = false;
    response = await response['data'];
    result = await response['result'];
    setState(() {});
    print(result.length);
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return response != null && !isLoading
        ? SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          if (result[0] != "")
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, left: 8, top: 8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(result[0].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: theme.accentColor)),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          child: Image.network(
                                              response['team'][0]['team']
                                                      ['flag']
                                                  .toString(),
                                              width: 25,
                                              height: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          response['team'][0]['team']['name']
                                                  .toString() ??
                                              "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text(
                                          response['team'][0]['team']['score']
                                                      .toString() +
                                                  "-" +
                                                  response['team'][0]['team']
                                                          ['wicket']
                                                      .toString() ??
                                              "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ),
                                      // const EdgeInsets.symmetric(horizontal: 0),
                                      Text(
                                        response['team'][0]['team']['over']
                                                .toString() ??
                                            "",
                                        style:
                                            theme.textTheme.bodyText2.copyWith(
                                          fontSize: 12,
                                          height: 1.2,
                                          // color: Colors.blueGrey.shade900,
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            child: Image.network(
                                                response['team']
                                                        .asMap()
                                                        .containsKey(1)
                                                    ? response['team'][1]
                                                            ['team']['flag']
                                                        .toString()
                                                    : "",
                                                width: 25,
                                                height: 25),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            response['team']
                                                    .asMap()
                                                    .containsKey(1)
                                                ? response['team'][1]['team']
                                                        ['name']
                                                    .toString()
                                                : "N.A.",
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              // color: Colors.blueGrey.shade900,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            response['team']
                                                    .asMap()
                                                    .containsKey(1)
                                                ? response['team'][1]['team']
                                                            ['score']
                                                        .toString() +
                                                    "-" +
                                                    response['team'][1]['team']
                                                            ['wicket']
                                                        .toString()
                                                : "",
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              // color: Colors.blueGrey.shade900,
                                            ),
                                          ),
                                        ),
                                        // const EdgeInsets.symmetric(horizontal: 0),
                                        Text(
                                          response['team']
                                                  .asMap()
                                                  .containsKey(1)
                                              ? response['team'][1]['team']
                                                      ['over']
                                                  .toString()
                                              : "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 12,
                                            height: 1.2,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 12, right: 12, bottom: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      response['team'][0]['team']['name'].toString() +
                              ' Batsman' ??
                          "N.A.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              if (response['team'].asMap().containsKey(0) &&
                  response['team'][0].containsKey('batsman') &&
                  response['team'][0]['batsman'].length > 0)
                SizedBox(
                    height:
                        response['team'][0]['batsman'].length > 2 ? 500 : 200,
                    child: ListView.builder(
                        itemCount: response['team'][0]['batsman'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: BatsmanCard(
                                  data: response['team'][0]['batsman'][index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 12, right: 12, bottom: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      response['team'][0]['team']['name'].toString() +
                              ' Bowler' ??
                          "N.A.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              if (response['team'].asMap().containsKey(0) &&
                  response['team'][0].containsKey('bolwer') &&
                  response['team'][0]['bolwer'].length > 0)
                SizedBox(
                    height:
                        response['team'][0]['bolwer'].length > 2 ? 500 : 200,
                    child: ListView.builder(
                        itemCount: response['team'][0]['bolwer'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: BowlerCard(
                                  data: response['team'][0]['bolwer'][index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 12, right: 12, bottom: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      response['team'][0]['team']['name'].toString() +
                              ' Fall Wickets' ??
                          "N.A.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              if (response['team'].asMap().containsKey(0) &&
                  response['team'][0].containsKey('fallwicket') &&
                  response['team'][0]['fallwicket'].length > 0)
                SizedBox(
                    height: response['team'][0]['fallwicket'].length > 2
                        ? 500
                        : 200,
                    child: ListView.builder(
                        itemCount: response['team'][0]['fallwicket'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: FallWicketCard(
                                  data: response['team'][0]['fallwicket']
                                      [index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
              if (response['team'].asMap().containsKey(1))
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 12, right: 12, bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        response['team'][1]['team']['name'].toString() +
                                ' Batsman' ??
                            "N.A.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: theme.accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              if (response['team'].asMap().containsKey(1) &&
                  response['team'][1].containsKey('batsman') &&
                  response['team'][1]['batsman'].length > 0)
                SizedBox(
                    height:
                        response['team'][1]['batsman'].length > 2 ? 500 : 200,
                    child: ListView.builder(
                        itemCount: response['team'][1]['batsman'].length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: BatsmanCard(
                                  data: response['team'][1]['batsman'][index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
              if (response['team'].asMap().containsKey(1))
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 12, right: 12, bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        response['team'][1]['team']['name'].toString() +
                                ' Bowler' ??
                            "N.A.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: theme.accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              if (response['team'].asMap().containsKey(1) &&
                  response['team'][1].containsKey('bolwer') &&
                  response['team'][1]['bolwer'].length > 0)
                SizedBox(
                    height:
                        response['team'][1]['bolwer'].length > 2 ? 500 : 200,
                    child: ListView.builder(
                        itemCount: response['team'][1]['bolwer'].length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: BowlerCard(
                                  data: response['team'][1]['bolwer'][index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
              if (response['team'].asMap().containsKey(1))
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 12, right: 12, bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        response['team'][1]['team']['name'].toString() +
                                ' Fall Wickets' ??
                            "N.A.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: theme.accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              if (response['team'].asMap().containsKey(1) &&
                  response['team'][1].containsKey('fallwicket') &&
                  response['team'][1]['fallwicket'].length > 0)
                SizedBox(
                    height: response['team'][1]['fallwicket'].length > 2
                        ? 500
                        : 200,
                    child: ListView.builder(
                        itemCount:
                            response['team'][1]['fallwicket'].length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ShakeListTransition(
                                duration: Duration(milliseconds: 1000),
                                child: FallWicketCard(
                                  data: response['team'][1]['fallwicket']
                                      [index],
                                )),
                            SizedBox(
                              height: 20.0,
                            )
                          ]);
                        })),
            ]),
          )
        : Center(child: Text('No data found.'));
  }
}
