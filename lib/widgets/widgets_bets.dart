import 'dart:convert';

import 'package:cric_dice/screens/bets/bet_details.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BetCard extends StatelessWidget {
  final String matchType;
  final String team;
  final String price;
  final String status;
  final String volume;
  final Function onTap;
  final fullData;

  BetCard(
      {this.matchType,
      this.team,
      this.price,
      this.volume,
      this.status,
      this.onTap,
      this.fullData});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(fullData['matchs'] + " " + fullData['venue'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.accentColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
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
                                borderRadius: BorderRadius.circular(12.5),
                                child: Image.network(
                                    fullData['team_a_img'].toString(),
                                    width: 25,
                                    height: 25),
                              ),
                            ),
                            Container(
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  fullData['team_a'],
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.5),
                                  child: Image.network(
                                      fullData['team_b_img'].toString(),
                                      width: 25,
                                      height: 25),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    fullData['team_b'],
                                    style: theme.textTheme.bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                      // color: Colors.blueGrey.shade900,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Chip(
                                backgroundColor: theme.focusColor,
                                avatar: Container(
                                  child: Icon(
                                    FontAwesomeIcons.solidCircle,
                                    color: status == 'In-Play'
                                        ? Colors.green
                                        : Color(0xFFfb6404),
                                    size: 14,
                                  ),
                                ),
                                label: Text('$status',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (fullData['result'] != "")
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(fullData['result'].toString() ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: theme.accentColor)),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SeriesName extends StatelessWidget {
  final String seriesName;
  SeriesName({this.seriesName});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text('$seriesName',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: theme.accentColor)),
      ),
    );
  }
}

// Upcoming matches

class UpcomingMatchesCard extends StatelessWidget {
  final String matchType;
  final String team;
  final String price;
  final String status;
  final fullData;
  final Function onTap;

  UpcomingMatchesCard(
      {this.matchType,
      this.team,
      this.price,
      this.status,
      this.fullData,
      this.onTap});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String handleDate(date) {
      var currDate = DateTime.now();
      var finalDate = "";
      date = date.split("-");
      if (int.parse(date[0]) == currDate.day) {
        finalDate = "Today";
      } else if (int.parse(date[0]) == currDate.day + 1) {
        finalDate = "Tomorrow";
      } else {
        finalDate = date.join(" ");
      }
      return finalDate;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(fullData['matchs'] + " " + fullData['series'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.accentColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.5),
                                child: Image.network(
                                    fullData['team_a_img'].toString(),
                                    width: 25,
                                    height: 25),
                              ),
                            ),
                            Container(
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  fullData['team_a'],
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.5),
                                  child: Image.network(
                                      fullData['team_b_img'].toString(),
                                      width: 25,
                                      height: 25),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    fullData['team_b'],
                                    style: theme.textTheme.bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                      // color: Colors.blueGrey.shade900,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            handleDate(fullData['match_date']) ?? '',
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight
                                  .bold, // color: Colors.blueGrey.shade900,
                            ),
                          ),
                          Text(
                            fullData['match_time'],
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              color: theme.accentColor,
                            ),
                          )
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
    );
  }
}

class RecentMatchesCard extends StatelessWidget {
  final String matchType;
  final String team;
  final String price;
  final String status;
  final fullData;
  final Function onTap;

  RecentMatchesCard(
      {this.matchType,
      this.onTap,
      this.team,
      this.price,
      this.status,
      this.fullData});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String handleDate(date) {
      var currDate = DateTime.now();
      var finalDate = "";
      date = date.split("-");
      if (int.parse(date[0]) == currDate.day) {
        finalDate = "Today";
      } else if (int.parse(date[0]) == currDate.day - 1) {
        finalDate = "Yesterday";
      } else {
        finalDate = date.join(" ");
      }
      return finalDate;
    }

    String handleResult(result) {
      var finalResult = "";
      if (result.toLowerCase().contains('abandoned')) {
        finalResult = "Match Abandoned";
      } else {
        finalResult = result;
      }
      return finalResult;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(fullData['matchs'] + " " + fullData['series'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.accentColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
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
                                borderRadius: BorderRadius.circular(12.5),
                                child: Image.network(
                                    fullData['team_a_img'].toString(),
                                    width: 25,
                                    height: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                fullData['team_a_short'],
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                fullData['team_a_scores'].toString() ?? "",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ),
                            // const EdgeInsets.symmetric(horizontal: 0),
                            Text(
                              fullData['team_a_over'].toString() ?? "",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 15,
                                // color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.5),
                                  child: Image.network(
                                      fullData['team_b_img'].toString(),
                                      width: 25,
                                      height: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  fullData['team_b_short'],
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  fullData['team_b_scores'].toString() ?? "",
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                              Text(
                                fullData['team_b_over'].toString() ?? "",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 15,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            handleDate(fullData['match_date']) ?? '',
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight
                                  .bold, // color: Colors.blueGrey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (fullData['result'] != "")
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            handleResult(fullData['result']).toString() ?? null,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: theme.accentColor,
                            ))),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class MatchFancyCard extends StatelessWidget {
  final data;

  MatchFancyCard({this.data});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Fancy :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            child: Text(
                              data['fancy'] ?? "N.A.",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 16,
                                height: 1.2,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Divider(height: 8, color: theme.accentColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Back Size',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Back Price',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Lay Price',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Lay Size',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['back_size'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['back_price'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['lay_size'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['lay_price'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(height: 8, color: theme.accentColor),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Created At :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Container(
                          width: 200,
                          child: Text(
                            data['created'] ?? "N.A.",
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveMatchesCard extends StatelessWidget {
  final String matchType;
  final String team;
  final String price;
  final String status;
  final fullData;
  final Function onTap;

  LiveMatchesCard(
      {this.matchType,
      this.onTap,
      this.team,
      this.price,
      this.status,
      this.fullData});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var teamAScore;
    var teamBScore;

    String handleDate(date) {
      var currDate = DateTime.now();
      var finalDate = "";
      date = date.split("-");
      if (int.parse(date[0]) == currDate.day) {
        finalDate = "Today";
      } else if (int.parse(date[0]) == currDate.day - 1) {
        finalDate = "Yesterday";
      } else {
        finalDate = date.join(" ");
      }
      return finalDate;
    }

    void handleInnings() {
      if (fullData.containsKey('team_a_score') &&
          fullData.containsKey('team_b_score')) {
        var a = fullData['team_a_score'];
        var b = fullData['team_b_score'];
        if (a.containsKey('1')) {
          teamAScore = a['1'];
          teamBScore = b['2'];
        } else {
          teamAScore = a['2'];
          teamBScore = b['1'];
        }
      } else if (fullData.containsKey('team_a_score') &&
          !fullData.containsKey('team_b_score')) {
        teamBScore = {"score": "0", "wicket": "0", "over": "0"};
        teamAScore = fullData['team_a_score']['1'];
      } else if (!fullData.containsKey('team_a_score') &&
          fullData.containsKey('team_b_score')) {
        teamAScore = {"score": "0", "wicket": "0", "over": "0"};
        teamBScore = fullData['team_b_score']['1'];
      } else if (!fullData.containsKey('team_a_score') &&
          !fullData.containsKey('team_b_score')) {
        teamAScore = {"score": "0", "wicket": "0", "over": "0"};
        teamBScore = {"score": "0", "wicket": "0", "over": "0"};
      }
    }

    handleInnings();
    print(fullData);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(fullData['matchs'] + " " + fullData['series'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.accentColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
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
                                borderRadius: BorderRadius.circular(12.5),
                                child: Image.network(
                                    fullData['team_a_img'].toString(),
                                    width: 25,
                                    height: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                fullData['team_a_short'],
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                teamAScore['score'].toString() ?? "",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ),
                            Text(
                              teamAScore['wicket'].toString() +
                                      "-" +
                                      teamAScore['over'].toString() ??
                                  "",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 14,
                                height: 1.2,
                                // color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.5),
                                  child: Image.network(
                                      fullData['tearm_b_img'].toString(),
                                      width: 25,
                                      height: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  fullData['team_b_short'],
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  teamBScore['score'].toString() +
                                          "-" +
                                          teamBScore['wicket'].toString() ??
                                      "",
                                  style: theme.textTheme.bodyText2.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    // color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                              Text(
                                teamBScore['over'].toString() ?? "",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 14,
                                  height: 1.2,
                                  // color: Colors.blueGrey.shade900,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            handleDate(fullData['match_date']) ?? '',
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight
                                  .bold, // color: Colors.blueGrey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (fullData['result'] != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(fullData['result'] ?? null,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: theme.accentColor)),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Dynamic {}
