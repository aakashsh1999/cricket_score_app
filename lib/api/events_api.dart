import 'package:cric_dice/constants.dart';
import 'package:cric_dice/models/events.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum HomeTab { today, upcoming, finished }

class EventsApi {
  static Future fetchData({HomeTab currentTab}) async {
    _listEvents.clear();

    Map<String,dynamic> params = {
      'include': 'visitorteam,localteam,stage',
      'api_token': kApiKey,
      // 'filter[starts_between]': '2019-03-03,2019-03-15'
    };
    if (currentTab == HomeTab.upcoming) {
      params['filter[starts_between]'] =
          '${DateTime.now().add(Duration(days: 1)).toIso8601String().substring(0, 10)},${DateTime.now().add(Duration(days: 15)).toIso8601String().substring(0, 10)}';
      print(params);
    }
    else if (currentTab == HomeTab.finished) {
      params['filter[starts_between]'] =
          '${DateTime.now().subtract(Duration(days: 15)).toIso8601String().substring(0, 10)},${DateTime.now().subtract(Duration(days: 1)).toIso8601String().substring(0, 10)}';
      print(params);
    }
    else if (currentTab == HomeTab.today) {
      params['filter[starts_between]'] =
          '${DateTime.now().toIso8601String().substring(0, 10)},${DateTime.now().add(Duration(days: 1)).toIso8601String().substring(0, 10)}';
      print(params);
    }
    var response = await http.get(
      Uri.https(kBaseUrl, '/api/v2.0/fixtures', params),
    );

    var result = convert.jsonDecode(response.body);

    print(result);
    if (result != null) {
      result["data"].forEach((element) {
        EventsModel eventsModel = EventsModel.fromJson(element);

        _listEvents.add(eventsModel);
      });
    }

    return _listEvents;
  }

  static List<EventsModel> get eListEvents => _listEvents;
  static List<EventsModel> _listEvents = [];
}
