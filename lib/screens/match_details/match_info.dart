import 'package:cric_dice/network/httpClient.dart';
import 'package:cric_dice/screens/match_details/squad_info.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'squad_info.dart';

class MatchInfo extends StatefulWidget {
  final int id;

  const MatchInfo({this.id});

  @override
  State<MatchInfo> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  final networkHandler = new NetworkHandler();
  var response;
  var isLoading = false;
  void getData() async {
    isLoading = true;
    response = await networkHandler.getById('/get_matchInfo', widget.id);
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
        ? ListView(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(response['series'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.accentColor,
                        )),
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Match Type:',
                                      style: theme.textTheme.bodyText2.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                        color: theme.accentColor,
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      response['match_type'],
                                      style: theme.textTheme.bodyText2.copyWith(
                                        fontSize: 14,
                                        height: 1.2,
                                        color: theme.accentColor,
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
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Status :',
                                      style: theme.textTheme.bodyText2.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                        color: theme.accentColor,
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      width: 250,
                                      child: Text(
                                        response['toss'].toString().isEmpty
                                            ? "N.A."
                                            : response['toss'].toString(),
                                        style:
                                            theme.textTheme.bodyText2.copyWith(
                                          fontSize: 14,
                                          color: theme.accentColor,
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
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_view_week,
                                  color: Colors.grey,
                                  size: 30.0,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      response['match_date'] +
                                          " " +
                                          response['match_time'],
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
                          Divider(
                            height: 8,
                            color: theme.accentColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 30.0,
                                ),
                                Container(
                                  width: 320,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(response['venue'],
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            height: 1.2,
                                            color: theme.accentColor,
                                          ))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 12, right: 12, bottom: 8),
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
                  InkWell(
                    onTap: () {
                      Get.to(() => SquadInfo(id: widget.id));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              border: Border.all(color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(8)),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                  response['team_a_img']
                                                      .toString(),
                                                  width: 30,
                                                  height: 30),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                response['team_a'],
                                                style: theme.textTheme.bodyText2
                                                    .copyWith(
                                                  fontSize: 14,
                                                  height: 1.2,
                                                  color: theme.accentColor,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 8,
                                  color: theme.accentColor,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                  response['team_b_img']
                                                      .toString(),
                                                  width: 30,
                                                  height: 30),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(response['team_b'],
                                                  style: theme
                                                      .textTheme.bodyText2
                                                      .copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: theme.accentColor,
                                                  ))),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 12, right: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text('Referees & Umpires',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: theme.accentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 10, bottom: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(8)),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          'Referee :',
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            color: theme.accentColor,
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          response['referee'].toString().isEmpty
                                              ? "N.A"
                                              : response['referee'].toString(),
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          'Umpire :',
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            color: theme.accentColor,
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          response['umpire'].toString().isEmpty
                                              ? "N.A."
                                              : response['umpire'].toString(),
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          'Third Umpire:',
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            color: theme.accentColor,
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          response['third_umpire']
                                                  .toString()
                                                  .isEmpty
                                              ? "N.A."
                                              : response['third_umpire']
                                                  .toString(),
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                            fontSize: 14,
                                            height: 1.2,
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
              )
            ],
          )
        : Center(child: Text('No data found.'));
  }
}




              //   height: 100,
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Column(
              //           children: [
              //             Container(
              //               width: 25,
              //               height: 25,
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(12.5),
              //                 child: Image.network(
              //                     response['team_a_img'].toString(),
              //                     width: 25,
              //                     height: 25),
              //               ),
              //             ),
              //             Container(
              //                 width: 200,
              //                 child: Padding(
              //                     padding: const EdgeInsets.only(left: 10.0),
              //                     child: Text(response['team_a_short'],
              //                         style: theme.textTheme.bodyText2.copyWith(
              //                           fontSize: 19,
              //                           fontWeight: FontWeight.bold,
              //                           height: 1.2,
              //                           // color: Colors.blueGrey.shade900,
              //                         )))),
              //           ],
              //         )
              //       ]),
              //       Row(children: [
              //         Column(
              //           children: [
              //             Container(
              //               width: 25,
              //               height: 25,
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(12.5),
              //                 child: Image.network(
              //                     response['team_a_img'].toString(),
              //                     width: 25,
              //                     height: 25),
              //               ),
              //             ),
              //             Container(
              //                 width: 200,
              //                 child: Padding(
              //                     padding: const EdgeInsets.only(left: 10.0),
              //                     child: Text(response['team_a_short'],
              //                         style: theme.textTheme.bodyText2.copyWith(
              //                           fontSize: 19,
              //                           fontWeight: FontWeight.bold,
              //                           height: 1.2,
              //                           // color: Colors.blueGrey.shade900,
              //                         )))),
              //           ],
              //         )
              //       ]),
              //     ],
              //   ),
              // ),
  // Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 20),
  //                   child: Row(children: [
  //                     Container(
  //                       width: 25,
  //                       height: 25,
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(12.5),
  //                         child: Image.network(
  //                             response['team_b_img'].toString(),
  //                             width: 25,
  //                             height: 25),
  //                       ),
  //                     ),
  //                     Container(
  //                       width: 200,
  //                       child: Padding(
  //                         padding: const EdgeInsets.only(left: 10),
  //                         child: Text(
  //                           response['team_b_short'],
  //                           style: theme.textTheme.bodyText2.copyWith(
  //                             fontSize: 19,
  //                             fontWeight: FontWeight.bold,
  //                             height: 1.2,
  //                             // color: Colors.blueGrey.shade900,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ]),
  //                 ),