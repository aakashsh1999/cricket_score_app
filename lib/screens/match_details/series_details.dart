import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/match_details/poins_table.dart';
import 'package:cric_dice/screens/match_details/squad_info.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'squad_info.dart';

class SeriesDetails extends StatefulWidget {
  final id;
  final seriesName;

  const SeriesDetails({this.id, this.seriesName});

  @override
  State<SeriesDetails> createState() => _SeriesDetailsState();
}

class _SeriesDetailsState extends State<SeriesDetails> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getBySId('/matchesBySeriesId', widget.id);
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: ShakeTransition(
              offset: 0,
              duration: Duration(milliseconds: 1600),
              child: Text(
                widget.seriesName ?? "",
                textAlign: TextAlign.center,
                style: theme.textTheme.headline1.copyWith(
                  color: theme.accentColor,
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text(
                  'Series Info',
                  style: theme.textTheme.bodyText2.copyWith(
                    fontSize: 14,
                    color: theme.accentColor,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                )),
                Tab(
                    child: Text(
                  'Points Table',
                  style: theme.textTheme.bodyText2.copyWith(
                    fontSize: 14,
                    color: theme.accentColor,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ))
              ],
            ),
          ),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : !response.isEmpty
                  ? TabBarView(
                      children: [
                        ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 12, right: 12, bottom: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('Teams',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border:
                                          Border.all(color: theme.primaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          response[0]
                                                                  ['team_a_img']
                                                              .toString(),
                                                          width: 30,
                                                          height: 30),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        response[0]['team_a']
                                                                .toString() ??
                                                            "N.A.",
                                                        style: theme
                                                            .textTheme.bodyText2
                                                            .copyWith(
                                                          color:
                                                              theme.accentColor,
                                                          fontSize: 16,
                                                          height: 1.2,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 8,
                                          color: theme.accentColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          response[0]
                                                                  ['team_b_img']
                                                              .toString(),
                                                          width: 30,
                                                          height: 30),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          response[0]['team_b']
                                                                  .toString() ??
                                                              "N.A.",
                                                          style: theme.textTheme
                                                              .bodyText2
                                                              .copyWith(
                                                            color: theme
                                                                .accentColor,
                                                            fontSize: 16,
                                                            height: 1.2,
                                                          ))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 12,
                                right: 12,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('Venue',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            // Container
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 12, right: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border:
                                          Border.all(color: theme.primaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.calendar_view_week,
                                                color: Colors.grey,
                                                size: 30.0,
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    response[0]['date_wise'] +
                                                        " " +
                                                        response[0]
                                                            ['match_time'],
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 8,
                                          color: theme.accentColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                                size: 30.0,
                                              ),
                                              Container(
                                                width: 320,
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        response[0]['venue'],
                                                        style: theme
                                                            .textTheme.bodyText2
                                                            .copyWith(
                                                          fontSize: 14,
                                                          height: 1.2,
                                                          color:
                                                              theme.accentColor,
                                                        ))),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 12,
                                right: 12,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('Match Info',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 12, right: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border:
                                          Border.all(color: theme.primaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Match Type:',
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Text(
                                                    response[0]['match_type']
                                                            .toString() ??
                                                        "N.A.",
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      height: 1.2,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            height: 8,
                                            color: theme.accentColor),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Matches :',
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Container(
                                                    width: 250,
                                                    child: Text(
                                                      response[0]['matchs']
                                                              .toString() ??
                                                          "N.A.",
                                                      style: theme
                                                          .textTheme.bodyText2
                                                          .copyWith(
                                                        color:
                                                            theme.accentColor,
                                                        fontSize: 14,
                                                        height: 1.2,
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 12,
                                right: 12,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('Rate',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 12, right: 12, bottom: 20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border:
                                          Border.all(color: theme.primaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Min Rate:',
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Text(
                                                    response[0]['min_rate']
                                                            .toString() ??
                                                        "N.A.",
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      height: 1.2,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 8,
                                          color: theme.accentColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Max Rate :',
                                                    style: theme
                                                        .textTheme.bodyText2
                                                        .copyWith(
                                                      color: theme.accentColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Container(
                                                    width: 250,
                                                    child: Text(
                                                      response[0]['max_rate']
                                                              .toString() ??
                                                          "N.A.",
                                                      style: theme
                                                          .textTheme.bodyText2
                                                          .copyWith(
                                                        color:
                                                            theme.accentColor,
                                                        fontSize: 14,
                                                        height: 1.2,
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        PointsTable(id: widget.id)
                      ],
                    )
                  : Center(child: Text('No data found.'))),
    );
  }
}
