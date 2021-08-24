import 'dart:io';
import 'dart:convert';
import 'package:cric_dice/api/clubs_api.dart';
import 'package:cric_dice/api/events_api.dart';
import 'package:cric_dice/api/leagues_api.dart';
import 'package:cric_dice/localizations/localization_constants.dart';
import 'package:cric_dice/models/events.dart';
import 'package:cric_dice/models/teams.dart';
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
  var response;

  @override
  void initState() {
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
                  text: "Today",
                ),
                Tab(text: "Upcoming"),
                Tab(text: "Finished"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomePageTab(
                tab: HomeTab.today,
              ),
              HomePageTab(
                tab: HomeTab.upcoming,
              ),
              HomePageTab(
                tab: HomeTab.finished,
              ),
            ],
          ),
        ));
  }
}

class HomePageTab extends StatelessWidget {
  const HomePageTab({@required this.tab});
  final HomeTab tab;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: EventsApi.fetchData(currentTab: tab).asStream(),
          builder: (context, snapshot) {
            if (snapshot == null || snapshot.data == null || !snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            List<EventsModel> eventsData = snapshot?.data ?? [];

            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                itemCount: eventsData?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ShakeListTransition(
                      duration: Duration(milliseconds: (4 + 3) * 300),
                      axis: Axis.vertical,
                      child: CardFavoritTeam(
                        onTap: () {
                          //TODO: Open Events Details
                          // Get.to(
                          //   () => EventDetails(id: 1, leagueId: 1),
                          // );
                        },
                        leagueName: eventsData[index].type ?? "",
                        status: eventsData[index].status ?? "",
                        subtitle: eventsData[index].note ?? "",
                        teamOne: eventsData[index].localTeamName ?? "",
                        teamOneBatting: false,
                        teamOneLogo: eventsData[index].localTeamImage ?? "",
                        teamOneScore: eventsData[index].localTeamScore ?? "",
                        teamOneWicketsDown:
                            eventsData[index].localTeamWicket ?? "",
                        teamTwo: eventsData[index].visitorTeamName ?? "",
                        teamTwoLogo: eventsData[index].visitorTeamImage ?? "",
                        teamTwoScore: eventsData[index].visitorTeamScore ?? "",
                        teamTwoWicketsDown:
                            eventsData[index].visitorTeamWicket ?? "",
                      ));
                });
          }),
      // );
      // }
    );
  }
}
