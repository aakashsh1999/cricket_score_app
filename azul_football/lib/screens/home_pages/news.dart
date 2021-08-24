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
        stream:  NewsApi.fetchData().asStream(),
        builder: (context, snapshot) {
        List<NewsModel>newsData=snapshot.data;
          if (snapshot == null ||snapshot.data==null)
              return Center(child: CircularProgressIndicator());

              return ListView.builder(
                  
                  itemCount: newsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShakeListTransition(
                      duration: Duration(milliseconds: 1800),
                      // axis: Axis.vertical,
                      child: CardLatestNews(
                        id:index,
                        category: newsData[index].category,
                        image: newsData[index].image,
                        title: newsData[index].title,
                        onTap: () {
                          //TODO : Open News
                          Get.to(
                            () =>  NewsDetails(
                                id:index,
                                data: newsData[index],
                                
                              ),
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

    