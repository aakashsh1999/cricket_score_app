import 'dart:convert';
import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/details/match_details.dart';
import 'package:cric_dice/screens/details/news_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../helpers/constants.dart';

// some code
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final networkHandler = new NetworkHandler();
  var isLoading = false;

  var response;
  void getData() async {
    isLoading = true;
    response = await networkHandler.get('/get_homelist');
    isLoading = false;
    response = await response['data'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return !response.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
                child: ListView.builder(
                    itemCount: int.parse('${response.length}'),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        ShakeListTransition(
                            duration: Duration(milliseconds: 1000),
                            child: SeriesName(
                                seriesName:
                                    response[index]['series'].toString() ??
                                        "")),
                        ShakeListTransition(
                          duration: Duration(milliseconds: 1000),
                          child: BetCard(
                              matchType:
                                  response[index]["match_type"].toString(),
                              team: response[index]["team_a"].toString(),
                              price: '20',
                              volume: response[index]["max_rate"].toString(),
                              status:
                                  response[index]["match_status"].toString(),
                              fullData: response[index],
                              onTap: () {
                                //TODO : Open
                                Get.to(() => MatchDetails(
                                      data: response[index],
                                    ));
                              }),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ]);
                    })),
          )
        : Center(child: Text('No Data Found'));
  }
}
