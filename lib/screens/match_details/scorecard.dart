import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scorecard extends StatefulWidget {
  final id;

  Scorecard({this.id});

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {
  final networkHandler = new NetworkHandler();
  var response;
  var result;
  void getData() async {
    response = await networkHandler.getById('/get_scorecard', widget.id);
    response = await response['data'];
    result = await response['data'];
    print(response);
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String handleResult(result) {
      var finalResult = "";

      finalResult = result;
      return finalResult;
    }

    return response != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          if (response['result'] != "")
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, left: 8, top: 8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                    handleResult(response['result'][0])
                                            .toString() ??
                                        null,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blueGrey)),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          child: Image.network(
                                              response['team'][0]['team']
                                                      ['flag']
                                                  .toString(),
                                              width: 25,
                                              height: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          response['team'][0]['team']['name']
                                                  .toString() ??
                                              "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text(
                                          response['team'][0]['team']['score']
                                                      .toString() +
                                                  "-" +
                                                  response['team'][0]['team']
                                                          ['wicket']
                                                      .toString() ??
                                              "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ),
                                      // const EdgeInsets.symmetric(horizontal: 0),
                                      Text(
                                        response['team'][0]['team']['over']
                                                .toString() ??
                                            "",
                                        style:
                                            theme.textTheme.bodyText2.copyWith(
                                          fontSize: 15,
                                          // color: Colors.blueGrey.shade900,
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            child: Image.network(
                                                response['team'][1]['team']
                                                        ['flag']
                                                    .toString(),
                                                width: 25,
                                                height: 25),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            response['team'][1]['team']['name']
                                                    .toString() ??
                                                "",
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              // color: Colors.blueGrey.shade900,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            response['team'][1]['team']['score']
                                                        .toString() +
                                                    "-" +
                                                    response['team'][0]['team']
                                                            ['wicket']
                                                        .toString() ??
                                                "",
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              // color: Colors.blueGrey.shade900,
                                            ),
                                          ),
                                        ),
                                        // const EdgeInsets.symmetric(horizontal: 0),
                                        Text(
                                          response['team'][1]['team']['over']
                                                  .toString() ??
                                              "",
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 15,
                                            // color: Colors.blueGrey.shade900,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
