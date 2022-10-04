import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/details/match_details.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatches extends StatefulWidget {
  @override
  State<LiveMatches> createState() => _LiveMatchesState();
}

class _LiveMatchesState extends State<LiveMatches> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;

  void getData() async {
    isLoading = true;
    response = await networkHandler.get('/get_liveMatchList');
    isLoading = false;
    response = response['data'];
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
                          child: LiveMatchesCard(
                              matchType:
                                  response[index]["match_type"].toString(),
                              team: response[index]["team_a"].toString(),
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
                    })))
        : Center(
            child: Text('No data found',
                style: TextStyle(color: theme.accentColor)));
  }
}
