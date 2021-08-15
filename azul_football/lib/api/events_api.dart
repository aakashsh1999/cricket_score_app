import 'package:azul_football/models/events.dart';
// import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class EventsApi {
  static List<EventsModel> eListEvents = [];

  static Future getData() async {
    eListEvents = [];
    var jsonText = await rootBundle.loadString('assets/dummyData/Live.json');
    var data = json.decode(jsonText);
     for (int i = 0; i < data["Matches"].length; i++) {
       print(i);
      eListEvents.add(
        EventsModel(
            status: data["Matches"][i]["Status"],
            teamOne: data["Matches"][i]["TeamOne"],
            teamTwo: data["Matches"][i]["TeamTwo"],
            type: data["Matches"][i]["Type"],
            firstInningsFinished: data["Matches"][i]["FirstInningsFinished"],
            teamOneScore: data["Matches"][i]["TeamOneScore"],
            teamTwoScore: data["Matches"][i]["TeamTwoScore"],
            teamOneOvers: data["Matches"][i]["teamOneOvers"],
            teamTwoOvers: data["Matches"][i]["teamTwoOvers"],
            teamOneWicketsDown: data["Matches"][i]["teamOneWicketsDown"],
            teamTwoWicketsDown: data["Matches"][i]["teamTwoWicketsDown"],
            teamOneLogo: data["Matches"][i]["teamOneLogo"],
            teamTwoLogo: data["Matches"][i]["teamTwoLogo"],
            subtitle: data["Matches"][i]["subtitle"],
            teamOneBatting: data["Matches"][i]["teamOneBatting"],
            id: i+1,
            timeMatch: "Now",
            dateMatch: "Today"),
      );
    }
  }
}
