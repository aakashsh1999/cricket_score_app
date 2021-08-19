import 'package:cric_dice/models/events.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as convert;
class EventsApi {
  



static Future fetchData() async {
    _listEvents.clear();
    var response = await http.get(
        Uri.https('cricket.sportmonks.com', '/api/v2.0/seasons/', {'include': '{fixtures,teams}'}),
        headers: {'api_token': 'TdM0zdrcsHz7ruUlxgi37Qf7iHCgXqCvKpiLJMBaUClJkgIrDczPF7s3byiE'});
    // print(response.body);
    var result = convert.jsonDecode(response.body);
    // print(result);
    // if (result['status'] == "ok") {
    //   result["articles"].forEach((element) {
    //     if (element['urlToImage'] != null && element['description'] != null) {
    //       EventsModel eventsModel = EventsModel(
              
    //           );
    //       _listEvents.add(eventsModel);
    //     }
    //   });
      
    // }
    result["data"]["fixtures"].forEach((element){
      EventsModel eventsModel =EventsModel.fromJson(element);

      _listEvents.add(eventsModel);
    });
    return _listEvents;
  }
  static List<EventsModel> get  eListEvents=> _listEvents;
  static List<EventsModel> _listEvents = [
// for(int i=0;i<4;i++)
// EventsModel(
//             status: "Tea Break",
//             teamOne: "India",
//             teamTwo: "England",
//             type:"Test",
//             firstInningsFinished: true,
//             teamOneScore: 364,
//             teamTwoScore: 310,
//             teamOneOvers: 126.1,
//             teamTwoOvers: 98.0,
//             teamOneWicketsDown: 11,
//             teamTwoWicketsDown: 5,
//             teamOneLogo: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Cricket_India_Crest.svg/1200px-Cricket_India_Crest.svg.png",
//             teamTwoLogo: "https://banner2.cleanpng.com/20180525/qgz/kisspng-england-cricket-team-australia-national-cricket-te-5b0818af5b12d6.4271737015272572633731.jpg",
//             subtitle: "Season 2: ENG trail by 54 runs",
//             teamOneBatting: false,
//             id: i+1,
//             timeMatch: "Now",
//             dateMatch: "Today",
//             leagueName:"India Tour of England 2021"),
      

  ];

  // static Future getData() async {
  //   eListEvents = [];
  //   var jsonText = await rootBundle.loadString('assets/dummyData/Live.json');
  //   var data = json.decode(jsonText);
  //    for (int i = 0; i < data["Matches"].length; i++) {
  //      print(i);
  //     eListEvents.add(
  //       EventsModel(
  //           status: data["Matches"][i]["Status"],
  //           teamOne: data["Matches"][i]["TeamOne"],
  //           teamTwo: data["Matches"][i]["TeamTwo"],
  //           type: data["Matches"][i]["Type"],
  //           firstInningsFinished: data["Matches"][i]["FirstInningsFinished"],
  //           teamOneScore: data["Matches"][i]["TeamOneScore"],
  //           teamTwoScore: data["Matches"][i]["TeamTwoScore"],
  //           teamOneOvers: data["Matches"][i]["teamOneOvers"],
  //           teamTwoOvers: data["Matches"][i]["teamTwoOvers"],
  //           teamOneWicketsDown: data["Matches"][i]["teamOneWicketsDown"],
  //           teamTwoWicketsDown: data["Matches"][i]["teamTwoWicketsDown"],
  //           teamOneLogo: data["Matches"][i]["teamOneLogo"],
  //           teamTwoLogo: data["Matches"][i]["teamTwoLogo"],
  //           subtitle: data["Matches"][i]["subtitle"],
  //           teamOneBatting: data["Matches"][i]["teamOneBatting"],
  //           id: i+1,
  //           timeMatch: "Now",
  //           dateMatch: "Today"),
  //     );
  //   }
  // }
}
