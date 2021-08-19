import 'dart:math';

import 'package:cric_dice/api/events_api.dart';
import 'dart:core';
import 'package:cric_dice/api/leagues_api.dart';
import 'package:cric_dice/api/news_api.dart';

import 'package:cric_dice/localizations/localization_constants.dart';
import 'package:cric_dice/models/news.dart';
import 'package:cric_dice/screens/details/events_details.dart';
import 'package:cric_dice/screens/details/news_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';

import 'package:cric_dice/widgets/widgets_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'bottom_nav_screen.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // var response;
  // List<NewsModel> _newsData=[];
  void initState() {
    super.initState();
    NewsApi.fetchData();
  }

  void dispose() {
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: ShakeTransition(
          duration: Duration(milliseconds: 1600),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.fire,
                  size: 22.0,
                  color: theme.primaryColor,
                ),
                SizedBox(width: 5.0),
                Text(
                  getTranslated(context, 'latest_stories'),
                  style: theme.textTheme.headline1.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder<Object>(
        stream: NewsApi.fetchData().asStream(),
        builder: (context, snapshot) {
        List<NewsModel>newsData=snapshot.data;
          if (snapshot == null ||snapshot.data==null)
              return Center(child: CircularProgressIndicator());

              return ListView.builder(
                  itemCount: newsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShakeListTransition(
                      duration: Duration(milliseconds: (4+ 3) * 300),
                      // axis: Axis.vertical,
                      child: CardLatestNews(
                        category: newsData[index].category,
                        image: newsData[index].image,
                        title: newsData[index].title,
                        onTap: () {
                          //TODO : Open News
                          Get.to(
                            () => BottomNavScreen(
                              screen: NewsDetails(
                                id:index,
                                data: newsData[index],
                              ),
                              indexPage: 3,
                            ),
                            transition: Transition.fadeIn,
                          );
                        },
                      ),
                    );
                  });
        }
      ),
    );
  }
}

         
          // 


          //   children: [
          //     SizedBox(height: 10.0),
          //     // // TODO: List Lives Favorites
          //     // Container(
          //     //   width: mSize.size.width,
          //     //   height: 100.0,
          //     //   child: ListView(
          //     //     scrollDirection: Axis.horizontal,
          //     //     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          //     //     children: [
          //     //       for (int i = 0; i < 4; i++)
          //     //         ShakeListTransition(
          //     //           duration: Duration(milliseconds: (i + 3) * 300),
          //     //           axis: Axis.horizontal,
          //     //           child: CardFavoritTeam(
          //     //             scoreHome: EventsApi.eListEvents[i].scoreHome,
          //     //             scoreAway: EventsApi.eListEvents[i].scoreAway,
          //     //             logoAway: EventsApi.eListEvents[i].logoAway,
          //     //             logoHome: EventsApi.eListEvents[i].logoHome,
          //     //             nameAway: EventsApi.eListEvents[i].nameAway,
          //     //             nameHome: EventsApi.eListEvents[i].nameHome,
          //     //             leagueName: LeaguesApi.lLeaguesList[i].name,
          //     //             onTap: () {
          //     //               //TODO: Open Events Details
          //     //               Get.to(
          //     //                 () => EventDetails(id: i, leagueId: i),
          //     //               );
          //     //             },
          //     //           ),
          //     //         ),
          //     //     ],
          //     //   ),
          //     // ),

          //     // SizedBox(height: 5.0),
          //     //TODO: Carousel Recent's news
          //     Container(
          //       width: mSize.size.width,
          //       height: 270,
          //       child: PageView(
          //         onPageChanged: (val) {
          //           setState(() {
          //             _selectedRecent = val;
          //           });
          //         },
          //         scrollDirection: Axis.horizontal,
          //         children: [
          //           for (int i = 0; i < 3; i++)
          //             ShakeTransition(
          //               duration: Duration(milliseconds: 1600),
          //               axis: Axis.horizontal,
          //               child: CardRecentNews(
          //                 title: NewsApi.aListNews[i].title,
          //                 image: NewsApi.aListNews[i].image,
          //                 date: NewsApi.aListNews[i].date,
          //                 category: NewsApi.aListNews[i].category,
          //                 onTap: () {
          //                   Get.to(
          //                     () => BottomNavScreen(
          //                       screen: NewsDetails(
          //                         id: i,
          //                       ),
          //                       //Todo: bouncing from need to resolve
          //                       indexPage: 3,
          //                     ),
          //                     transition: Transition.fadeIn,
          //                   );
          //                 },
          //               ),
          //             ),
          //         ],
          //       ),
          //     ),
          //     //Swiper
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         for (int i = 0; i < 3; i++)
          //           ShakeTransition(
          //             duration: Duration(milliseconds: 1600),
          //             child: AnimatedContainer(
          //               duration: Duration(milliseconds: 300),
          //               curve: Curves.easeInSine,
          //               width: _selectedRecent == i ? 50.0 : 10.0,
          //               height: 10.0,
          //               margin: EdgeInsets.symmetric(horizontal: 1.0),
          //               decoration: BoxDecoration(
          //                 color: _selectedRecent == i
          //                     ? theme.primaryColor
          //                     : theme.primaryColor.withOpacity(0.5),
          //                 borderRadius: BorderRadius.circular(20.0),
          //               ),
          //             ),
          //           ),
          //       ],
          //     ),
        // ],
      // ),
    // );
