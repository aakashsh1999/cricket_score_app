import 'package:flutter/cupertino.dart';

class EventsModel {
  final int id;
  final String status;
  final String dateMatch;
  final String timeMatch;
  final String teamOne;
  final String teamTwo;
  final String type;
  final bool firstInningsFinished;
  final int teamOneScore;
  final int teamTwoScore;
  final double teamOneOvers;
  final double teamTwoOvers;
  final int teamOneWicketsDown;
  final int teamTwoWicketsDown;
  final String teamOneLogo;
  final String teamTwoLogo;
  final String subtitle;
  final bool teamOneBatting;
  final String leagueName;
  EventsModel(
    {
    @required  this.status,
    @required this.teamOne,
    @required this.teamTwo,
    @required this.type,
    @required this.firstInningsFinished,
    @required this.teamOneScore,
    @required this.teamTwoScore,
    @required this.teamOneOvers,
    @required this.teamTwoOvers,
    @required this.teamOneWicketsDown,
    @required this.teamTwoWicketsDown,
    @required this.teamOneLogo,
    @required this.teamTwoLogo,
    @required this.subtitle,
    @required this.teamOneBatting, 
    @required this.id,
    @required this.dateMatch,
    @required this.timeMatch,
    @required this.leagueName, 
  });
}
