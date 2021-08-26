import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BetCard extends StatelessWidget {
  final String matchType;
  final String team;
  final String price;
  final String status;
  final String volume;
  final Function onTap;

  BetCard({this.matchType, this.team, this.price, this.volume, this.status, this.onTap});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          // color: theme.focusColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: theme.focusColor,
                  avatar: Container(
                    child: Icon(
                      FontAwesomeIcons.solidCircle,
                      color: status == 'In-Play' ? Colors.green : Colors.blueGrey,
                      size: 15,
                    ),
                  ),
                  label: Text('$status'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: theme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Vol: $volume',
                      style: theme.textTheme.bodyText2
                          .copyWith(fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            '$matchType',
            style: theme.textTheme.bodyText1.copyWith(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '$team',
            style: theme.textTheme.bodyText1.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: Colors.blueGrey.shade900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
        ]),
      ),
    );
  }
}
