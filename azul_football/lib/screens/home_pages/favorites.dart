import 'package:azul_football/api/clubs_api.dart';
import 'package:azul_football/api/events_api.dart';
import 'package:azul_football/api/leagues_api.dart';
import 'package:azul_football/localizations/localization_constants.dart';
import 'package:azul_football/screens/details/events_details.dart';

import 'package:azul_football/screens/favorites/favorites_clubs.dart';
import 'package:azul_football/widgets/trensations_widgets.dart';
import 'package:azul_football/widgets/widgets_favourites.dart';
import 'package:azul_football/widgets/widgets_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEdit = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorDark,
        automaticallyImplyLeading: false,
        // title: Text(getTranslated(context, 'favor_clubs')),
        title:Text('Home'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       _isEdit ? FontAwesomeIcons.solidEdit : FontAwesomeIcons.edit,
        //       color: Colors.white,
        //       size: 20.0,
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         _isEdit = !_isEdit;
        //       });
        //     },
        //   ),
        // ],
      ),
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   mainAxisSpacing: 10.0,
      //   crossAxisSpacing: 5.0,
      //   childAspectRatio: 0.9,
      //   padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      //   children: [
      //     for (int i = 0; i < ClubsApi.cListClubs.length; i++)
      //       if (ClubsApi.cListClubs[i].picked == true)
      //         ShakeListTransition(
      //           duration: Duration(milliseconds: (i + 3) * 200),
      //           child: CardFavouriteTeam(
      //             isEdit: _isEdit,
      //             logo: ClubsApi.cListClubs[i].logo,
      //             name: ClubsApi.cListClubs[i].name,
      //             onDelete: () {
      //               //TODO : delete club
      //               setState(() {
      //                 ClubsApi.cListClubs[i].picked = false;
      //               });
      //             },
      //           ),
      //         ),
      //     CardFavouriteAdd(
      //       onTap: () {
      //         //TODO: Add more clubs
      //         Get.to(
      //           () => FavoritesClubsScreen(
      //             fromHome: true,
      //           ),
      //           transition: Transition.downToUp,
      //         ).then((value) {
      //           setState(() {});
      //         });
      //       },
      //     ),
      //   ],
      // ),
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
