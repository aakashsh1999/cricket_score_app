import 'package:azul_football/api/clubs_api.dart';
import 'package:azul_football/api/events_api.dart';
import 'package:azul_football/api/leagues_api.dart';
import 'package:azul_football/localizations/localization_constants.dart';
import 'package:azul_football/screens/details/events_details.dart';
import 'package:azul_football/api/hometab_api.dart';
import 'package:azul_football/screens/favorites/favorites_clubs.dart';
import 'package:azul_football/widgets/trensations_widgets.dart';
import 'package:azul_football/widgets/widgets_favourites.dart';
import 'package:azul_football/widgets/widgets_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:azul_football/api/leagues_api.dart';
import 'package:azul_football/widgets/widgets_news.dart';
import 'package:azul_football/screens/details/events_details.dart';
import 'package:azul_football/api/events_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEdit = false;

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context);
    final theme = Theme.of(context);

    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColorDark,
          automaticallyImplyLeading: false,
          title: Text('Cricket Data',
          style: TextStyle(fontSize: 24.0),
          ),
          centerTitle: false,
           bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5.0,
            tabs: [
              Tab(text: "Live",),
              Tab(text: "Upcoming"),
              Tab(text: "Finished"),
            ],
        ),
        ),
         body: TabBarView(
          children: [
            Container( child:  ListView(
              // scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              children: [
                for (int i = 0; i < 4; i++)
                  ShakeListTransition(
                    duration: Duration(milliseconds: (i + 3) * 300),
                    axis: Axis.vertical,
                    child: CardFavoritTeam(
                      scoreHome: EventsApi.eListEvents[i].scoreHome,
                      scoreAway: EventsApi.eListEvents[i].scoreAway,
                      logoAway: EventsApi.eListEvents[i].logoAway,
                      logoHome: EventsApi.eListEvents[i].logoHome,
                      nameAway: EventsApi.eListEvents[i].nameAway,
                      nameHome: EventsApi.eListEvents[i].nameHome,
                      leagueName: LeaguesApi.lLeaguesList[i].name,
                      onTap: () {
                        //TODO: Open Events Details
                        Get.to(
                          () => EventDetails(id: i, leagueId: i),
                        );
                      },
                    ),
                  ),
              ],
            ),),
            Center( child: Text("Page 2")),
              Center( child: Text("Page 3")),
          ],
        ),
      body: ListView(
              // scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              children: [
                for (int i = 0; i < 4; i++)
                  ShakeListTransition(
                    duration: Duration(milliseconds: (i + 3) * 300),
                    axis: Axis.vertical,
                    child: CardFavoritTeam(
                      scoreHome: EventsApi.eListEvents[i].scoreHome,
                      scoreAway: EventsApi.eListEvents[i].scoreAway,
                      logoAway: EventsApi.eListEvents[i].logoAway,
                      logoHome: EventsApi.eListEvents[i].logoHome,
                      nameAway: EventsApi.eListEvents[i].nameAway,
                      nameHome: EventsApi.eListEvents[i].nameHome,
                      leagueName: LeaguesApi.lLeaguesList[i].name,
                      onTap: () {
                        //TODO: Open Events Details
                        Get.to(
                          () => EventDetails(id: i, leagueId: i),
                        );
                      },
                    ),
                  ),
              ],
            ),
    );
  }
}
