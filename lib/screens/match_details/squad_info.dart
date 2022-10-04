import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquadInfo extends StatefulWidget {
  final id;

  SquadInfo({this.id});

  @override
  State<SquadInfo> createState() => _SquadInfoState();
}

class _SquadInfoState extends State<SquadInfo> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getById('/get_squadByMatchId', widget.id);
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
            elevation: 3,
            title: ShakeTransition(
              duration: Duration(milliseconds: 1600),
              child: Row(
                children: [
                  Text(
                    'Squad Info',
                    style: theme.textTheme.headline1
                        .copyWith(color: theme.accentColor),
                  ),
                ],
              ),
            ),
            bottom: TabBar(tabs: [
              Tab(
                  child: Text(
                "Team A",
                style: TextStyle(color: theme.accentColor),
              )),
              Tab(
                  child: Text(
                "Team B",
                style: TextStyle(color: theme.accentColor),
              )),
            ]),
          ),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : !response.isEmpty
                  ? TabBarView(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, right: 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            response['team_a']['flag']
                                                .toString(),
                                            width: 30,
                                            height: 30),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(response['team_a']['name'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: theme.accentColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      response['team_a']['player'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 10,
                                          left: 10,
                                          right: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: theme.primaryColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          response['team_a']
                                                                      ['player']
                                                                  [
                                                                  index]['image']
                                                              .toString(),
                                                          width: 30,
                                                          height: 30),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                child: Text(
                                                                  'Name :',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyText2
                                                                      .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    height: 1.2,
                                                                  ),
                                                                )),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        4),
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    response['team_a']['player'][index]['name']
                                                                            .toString() ??
                                                                        "N.A.",
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            height:
                                                                                1.2,
                                                                            color:
                                                                                theme.accentColor),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        2),
                                                                child: Text(
                                                                  'Role :',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyText2
                                                                      .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    height: 1.2,
                                                                  ),
                                                                )),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        4),
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    response['team_a']['player'][index]
                                                                            [
                                                                            'play_role'] ??
                                                                        "N.A.",
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            height:
                                                                                1.2,
                                                                            color:
                                                                                theme.accentColor),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, right: 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            response['team_b']['flag']
                                                .toString(),
                                            width: 30,
                                            height: 30),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(response['team_b']['name'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: theme.accentColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      response['team_b']['player'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 10,
                                          left: 10,
                                          right: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: theme.primaryColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          response['team_b']
                                                                      ['player']
                                                                  [
                                                                  index]['image']
                                                              .toString(),
                                                          width: 30,
                                                          height: 30),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                child: Text(
                                                                  'Name :',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyText2
                                                                      .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    height: 1.2,
                                                                  ),
                                                                )),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        4),
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    response['team_b']['player'][index]['name']
                                                                            .toString() ??
                                                                        "N.A.",
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            height:
                                                                                1.2,
                                                                            color:
                                                                                theme.accentColor),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        2),
                                                                child: Text(
                                                                  'Role :',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyText2
                                                                      .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    height: 1.2,
                                                                  ),
                                                                )),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        4),
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    response['team_b']['player'][index]
                                                                            [
                                                                            'play_role'] ??
                                                                        "N.A.",
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            height:
                                                                                1.2,
                                                                            color:
                                                                                theme.accentColor),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: Text('No data found.'),
                    )),
    );
  }
}
