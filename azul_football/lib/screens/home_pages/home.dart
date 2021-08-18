import 'dart:io';
import 'dart:convert';
import 'package:cric_dice/api/clubs_api.dart';
import 'package:cric_dice/api/events_api.dart';
import 'package:cric_dice/api/leagues_api.dart';
import 'package:cric_dice/localizations/localization_constants.dart';
import 'package:cric_dice/models/events.dart';
import 'package:cric_dice/screens/details/events_details.dart';
import 'package:cric_dice/api/hometab_api.dart';
import 'package:cric_dice/screens/favorites/favorites_clubs.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:cric_dice/widgets/widgets_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:cric_dice/api/leagues_api.dart';
import 'package:cric_dice/widgets/widgets_news.dart';
import 'package:cric_dice/screens/details/events_details.dart';
import 'package:cric_dice/api/events_api.dart';
import 'package:http/http.dart' as http;

// some code
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEdit = false;
  List<EventsModel> _eventsModel=[];
  var response;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

    Future fetchData() async {
    _eventsModel.clear();
    response = await http.get(Uri.parse('https://cricket.sportmonks.com/api/v2.0/seasons/507?api_token=TdM0zdrcsHz7ruUlxgi37Qf7iHCgXqCvKpiLJMBaUClJkgIrDczPF7s3byiE&include=fixtures,teams&filter[visitorteam_id]=10'));
    print(response.body);
    var result = jsonDecode(response.body);
    
  }
  

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context);
    final theme = Theme.of(context);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: theme.primaryColorDark,
            automaticallyImplyLeading: false,
            title: Text(
              'Cricket Data',
              style: TextStyle(fontSize: 24.0),
            ),
            centerTitle: false,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5.0,
              tabs: [
                Tab(
                  text: "Live",
                ),
                Tab(text: "Upcoming"),
                Tab(text: "Finished"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return ListView(
                        // scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        children: [
                          for (int i = 0; i < EventsApi.eListEvents.length; i++)
                            ShakeListTransition(
                              duration: Duration(milliseconds: (i + 3) * 300),
                              axis: Axis.vertical,
                              child: CardFavoritTeam(
                                teamOneScore:
                                    EventsApi.eListEvents[i].teamOneScore,
                                teamTwoScore:
                                    EventsApi.eListEvents[i].teamTwoScore,
                                teamTwoLogo:
                                    EventsApi.eListEvents[i].teamTwoLogo,
                                teamOneLogo:
                                    EventsApi.eListEvents[i].teamOneLogo,
                                teamTwo: EventsApi.eListEvents[i].teamTwo,
                                teamOne: EventsApi.eListEvents[i].teamOne,
                                // leagueName: LeaguesApi.lLeaguesList[i].name,
                                leagueName: EventsApi.eListEvents[i].leagueName,
                                status: EventsApi.eListEvents[i].status,
                                subtitle: EventsApi.eListEvents[i].subtitle,
                                teamOneBatting:
                                    EventsApi.eListEvents[i].teamOneBatting,
                                teamOneOvers:
                                    EventsApi.eListEvents[i].teamOneOvers,
                                teamTwoOvers:
                                    EventsApi.eListEvents[i].teamTwoOvers,
                                teamOneWicketsDown:
                                    EventsApi.eListEvents[i].teamOneWicketsDown,
                                teamTwoWicketsDown:
                                    EventsApi.eListEvents[i].teamTwoWicketsDown,
                                onTap: () {
                                  //TODO: Open Events Details
                                  Get.to(
                                    () => EventDetails(id: i, leagueId: i),
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    }),
              ),
              Center(child: Text("Page 2")),
              Center(child: Text("Page 3")),
            ],
          ),
        ));
  }
}
