import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/details/match_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentMatches extends StatefulWidget {
  @override
  State<RecentMatches> createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.get('/get_recentMatches');
    isLoading = false;
    response = await response['data'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
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
                          child: RecentMatchesCard(
                              matchType:
                                  response[index]["match_type"].toString(),
                              team: response[index]["team_a"].toString(),
                              price: '20',
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
        : Center(child: Text('No data found'));
  }
}
