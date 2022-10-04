import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fantasy extends StatefulWidget {
  final id;

  Fantasy({this.id});

  @override
  State<Fantasy> createState() => _FantasyState();
}

class _FantasyState extends State<Fantasy> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getById('/get_matchFancy', widget.id);
    isLoading = false;
    response = await response['data'];
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return !response.isEmpty
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
                              child: MatchFancyCard(
                                data: response[index],
                              )),
                          SizedBox(
                            height: 20.0,
                          )
                        ]);
                      })),
            ),
          )
        : Center(child: Text('No data found.'));
  }
}
