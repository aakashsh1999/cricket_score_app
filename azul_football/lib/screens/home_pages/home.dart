import 'package:azul_football/api/clubs_api.dart';
import 'package:azul_football/api/events_api.dart';
import 'package:azul_football/api/leagues_api.dart';
import 'package:azul_football/localizations/localization_constants.dart';
import 'package:azul_football/screens/details/events_details.dart';
import 'package:azul_football/api/hometab_api.dart';
import 'package:azul_football/screens/favorites/favorites_clubs.dart';
import 'package:azul_football/widgets/trensations_widgets.dart';
import 'package:azul_football/widgets/widgets_home.dart';
import 'package:azul_football/widgets/widgets_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:azul_football/api/leagues_api.dart';
import 'package:azul_football/widgets/widgets_news.dart';
import 'package:azul_football/screens/details/events_details.dart';
import 'package:azul_football/api/events_api.dart';

// some code
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    // EventsApi.getData();
    super.initState();
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      children: [
                        for (int i = 0; i < EventsApi.eListEvents.length; i++)
                          ShakeListTransition(
                            duration: Duration(milliseconds: (i + 3) * 300),
                            axis: Axis.vertical,
                            child: CardFavoritTeam(
                              teamOneScore: EventsApi.eListEvents[i].teamOneScore,
                              teamTwoScore: EventsApi.eListEvents[i].teamTwoScore,
                              teamTwoLogo: EventsApi.eListEvents[i].teamTwoLogo,
                              teamOneLogo: EventsApi.eListEvents[i].teamOneLogo,
                              teamTwo: EventsApi.eListEvents[i].teamTwo,
                              teamOne: EventsApi.eListEvents[i].teamOne,
                              // leagueName: LeaguesApi.lLeaguesList[i].name,
                              leagueName: EventsApi.eListEvents[i].leagueName,
                              status: EventsApi.eListEvents[i].status,
                              subtitle: EventsApi.eListEvents[i].subtitle,
                              teamOneBatting: EventsApi.eListEvents[i].teamOneBatting,
                              teamOneOvers: EventsApi.eListEvents[i].teamOneOvers,
                              teamTwoOvers: EventsApi.eListEvents[i].teamTwoOvers,
teamOneWicketsDown: EventsApi.eListEvents[i].teamOneWicketsDown,
                              teamTwoWicketsDown: EventsApi.eListEvents[i].teamTwoWicketsDown,
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
                  }
                ),
              ),
              Center(child: Text("Page 2")),
              Center(child: Text("Page 3")),
            ],
          ),
        ));
  }
}
