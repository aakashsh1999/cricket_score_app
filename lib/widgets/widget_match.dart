import 'package:flutter/material.dart';

class MatchOddHistoryCard extends StatelessWidget {
  final data;

  MatchOddHistoryCard({this.data});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 2),
                        child: Text(
                          'Match Odd ID :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Container(
                          child: Text(
                            data['match_odd_id'].toString() ?? "N.A.",
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 2),
                        child: Text(
                          'Team :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Container(
                          width: 260,
                          child: Text(
                            data['team'].toString() ?? "N.A.",
                            style: theme.textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Divider(height: 8, color: theme.accentColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Innings',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Score',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Overs',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Runs',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['inning'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['score'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['overs'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['runs'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Divider(height: 8, color: theme.accentColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Min Rate',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Max Rate',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'S. Min',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'S. Max',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['min_rate'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['max_rate'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['s_min'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['s_max'] ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(height: 8, color: theme.accentColor),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Created At :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              Text(
                                data['date_time'].toString().split(' ')[0] ??
                                    "N.A.",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                data['time'].toString() ?? "N.A.",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PointsTableCard extends StatelessWidget {
  final data;

  PointsTableCard({this.data});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(data['flag'].toString(),
                                width: 30, height: 30),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['teams'].toString() ?? "N.A.",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 18,
                                height: 1.2,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Divider(height: 8, color: theme.accentColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'P',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'W',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'L',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'NR',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'PTS',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'NRR',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data['P'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                    Text(data['W'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                    Text(data['L'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                    Text(data['NR'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                    Text(data['Pts'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                    Text(data['NRR'].toString() ?? "N.A.",
                        style:
                            TextStyle(color: theme.accentColor, fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
