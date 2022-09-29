import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widget_match.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchOddHistory extends StatefulWidget {
  final id;

  MatchOddHistory({this.id});

  @override
  State<MatchOddHistory> createState() => _MatchOddHistoryState();
}

class _MatchOddHistoryState extends State<MatchOddHistory> {
  final networkHandler = new NetworkHandler();
  var response;
  void getData() async {
    response = await networkHandler.getById('/get_matchoddHistory', widget.id);
    response = await response['data'];
    print(response);
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return response != null
        ? Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  child: ListView.builder(
                      itemCount: int.parse('${response.length}'),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          ShakeListTransition(
                              duration: Duration(milliseconds: 1000),
                              child: MatchOddHistoryCard(
                                data: response[index],
                              )),
                          SizedBox(
                            height: 20.0,
                          )
                        ]);
                      })),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
