import 'package:flutter/material.dart';

class BatsmanCard extends StatelessWidget {
  final data;

  BatsmanCard({this.data});

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
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Name :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: theme.accentColor,
                          ),
                        )),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            child: Text(
                              data['name'] ?? "N.A.",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 16,
                                height: 1.2,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Divider(
                height: 8,
                color: theme.accentColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Run',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: theme.accentColor,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Ball',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: theme.accentColor,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Fours',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Sixes',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: theme.accentColor,
                          ),
                        )),
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
                          child: Text(data['run'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['ball'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['fours'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
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
                          child: Text(data['sixes'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                height: 8,
                color: theme.accentColor,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Out By:',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: theme.accentColor,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: Container(
                          width: 200,
                          child: Text(
                            data['out_by'].toString() ?? "N.A.",
                            style: theme.textTheme.bodyText2.copyWith(
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
        ),
      ),
    );
  }
}

class BowlerCard extends StatelessWidget {
  final data;

  BowlerCard({this.data});

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
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Name :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            child: Text(
                              data['name'].toString() ?? "N.A.",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 16,
                                height: 1.2,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Divider(
                height: 8,
                color: theme.accentColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Over',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Maiden',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Run',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Wicket',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
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
                          child: Text(data['over'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['maiden'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Text(data['run'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
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
                          child: Text(data['wicket'].toString() ?? "N.A.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                height: 8,
                color: theme.accentColor,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Text(
                              'Economy :',
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
                              child: Text(
                                data['economy'].toString() ?? "N.A.",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Text(
                              'Dot Balls :',
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
                              child: Text(
                                data['dot_ball'].toString() ?? "N.A.",
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            )),
                      ],
                    )
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

class FallWicketCard extends StatelessWidget {
  final data;

  FallWicketCard({this.data});

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
                            vertical: 8, horizontal: 4),
                        child: Text(
                          'Player :',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Container(
                            child: Text(
                              data['player'].toString() ?? "N.A.",
                              style: theme.textTheme.bodyText2.copyWith(
                                fontSize: 16,
                                height: 1.2,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Divider(
                height: 8,
                color: theme.accentColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Score',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Wicket',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Over',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Text(data['score'].toString() ?? "N.A.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Text(data['wicket'].toString() ?? "N.A.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Text(data['over'].toString() ?? "N.A.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14))),
                      ),
                    ),
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
