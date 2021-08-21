import 'package:cric_dice/constants.dart';
import 'package:cric_dice/models/teams.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as convert;

class TeamsApi {
  static Future fetchData() async {
    _listTeams.clear();
    var response = await http.get(
        Uri.https(kBaseUrl, '/api/v2.0/teams/', {
          'include': 'country',
          'api_token':
              kApiKey
        }),
        headers: {
         
        });
    // print(response.body);
    var result = convert.jsonDecode(response.body);
    print(result);
    // if (result['status'] == "ok") {
    //   result["articles"].forEach((element) {
    //     if (element['urlToImage'] != null && element['description'] != null) {
    //       EventsModel eventsModel = EventsModel(

    //           );
    //       _listEvents.add(eventsModel);
    //     }
    //   });

    // }
    if (result != null) {
      result["data"].forEach((element) {
        TeamsModel teamsModel = TeamsModel.fromJson(element);

        _listTeams.add(teamsModel);
      });
    }
    return _listTeams;
  }

  static List<TeamsModel> get tListTeams => _listTeams;
  static TeamsModel getTeam(int id) {
    return _listTeams.firstWhere((element) => element.id == id);
  }

  static List<TeamsModel> _listTeams = [
    // TeamsModel(
    //   id: 0,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/-WjHLbBIQO9xE2e2MW3OPQ_48x48.png',
    //   name: 'Wolves',
    //   picked: true,
    // ),
    // TeamsModel(
    //   id: 1,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/bXkiyIzsbDip3x2FFcUU3A_48x48.png',
    //   name: 'West Ham',
    // ),
    // TeamsModel(
    //   id: 2,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/udQ6ns69PctCv143h-GeYw_48x48.png',
    //   name: 'Man United',
    // ),
    // TeamsModel(
    //   id: 3,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/EKIe0e-ZIphOcfQAwsuEEQ_48x48.png',
    //   name: 'Brighton',
    //   picked: true,
    // ),
    // TeamsModel(
    //   id: 4,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/wF8AgQsssfy3_GLyVR3dSg_48x48.png',
    //   name: 'Sheffield United',
    // ),
    // TeamsModel(
    //   id: 5,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/4us2nCgl6kgZc0t3hpW75Q_48x48.png',
    //   name: 'Arsenal',
    // ),
    // TeamsModel(
    //   id: 6,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/C3J47ea36cMBc4XPbp9aaA_48x48.png',
    //   name: 'Everton',
    //   picked: true,
    // ),
    // TeamsModel(
    //   id: 7,
    //   logo:
    //       'https://ssl.gstatic.com/onebox/media/sports/logos/8piQOzndGmApKYTcvyN9vA_48x48.png',
    //   name: 'Crystal Palace',
    // ),
  ];
}
