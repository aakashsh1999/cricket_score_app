import 'package:cric_dice/api/events_api.dart';
import 'package:cric_dice/localizations/localization_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFavoritTeam extends StatelessWidget {
  final Function onTap;
  final String teamOneLogo, teamTwoLogo;
  final String teamOne, teamTwo;
  final String teamOneScore, teamTwoScore;
  final String leagueName;
  final String status;
  // final double teamOneOvers, teamTwoOvers;
  final String subtitle;
  final bool teamOneBatting;
  final String teamOneWicketsDown, teamTwoWicketsDown;

  final HomeTab homeTab;

  final String startAt;

  CardFavoritTeam({
    @required this.onTap,
    @required this.teamOneLogo,
    @required this.teamTwoLogo,
    @required this.teamOne,
    @required this.teamTwo,
    @required this.teamOneScore,
    @required this.teamTwoScore,
    @required this.leagueName,
    @required this.status,
    // @required this.teamOneOvers,
    // @required this.teamTwoOvers,
    @required this.subtitle,
    @required this.homeTab,
    @required this.teamOneBatting,
    @required this.teamOneWicketsDown,
    @required this.teamTwoWicketsDown,
    this.startAt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 230.0,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        margin: EdgeInsets.symmetric(vertical: 3.0),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: theme.hintColor.withOpacity(0.15),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // width: 65,
              decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              child: Text(
                '$leagueName',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardFavTeam(
                  logo: teamOneLogo,
                  name: teamOne,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    homeTab == HomeTab.upcoming
                        ? Text(
                            'Match Starting in\n${DateTime.parse(startAt).difference(DateTime.now()).inDays} days',
                            style: theme.textTheme.headline1
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          )
                        : RichText(
                            // textstyle: theme.textTheme.headline1.copyWith(fontSize: 28),
                            // text: '$teamOneScore : $teamTwoScore',
                            text: TextSpan(
                                style: theme.textTheme.headline1
                                    .copyWith(fontSize: 22),
                                children: [
                                  TextSpan(text: '$teamOneScore'),
                                  TextSpan(
                                      text: '/$teamOneWicketsDown',
                                      style: theme.textTheme.headline3),
                                  TextSpan(text: ' : $teamTwoScore'),
                                  TextSpan(
                                      text: '/$teamTwoWicketsDown',
                                      style: theme.textTheme.headline3),
                                ]),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Icon(Icons.sports_cricket_rounded),
                          visible: teamOneBatting && homeTab == HomeTab.today,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 2.0),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Icon(Icons.sports_cricket_rounded),
                          visible: !teamOneBatting && homeTab == HomeTab.today,
                        ),
                      ],
                    ),
                  ],
                ),
                CardFavTeam(
                  name: teamTwo,
                  logo: teamTwoLogo,
                  // batting: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Center(
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: subtitle,
                    style: theme.textTheme.subtitle2.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardFavTeam extends StatelessWidget {
  final logo;
  final name;
  final bool batting;
  CardFavTeam({this.logo, this.name, this.batting});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 65.0,
            height: 65.0,
            fit: BoxFit.contain,
            image: NetworkImage(logo),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 80.0,
            child: RichText(
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: name,
                style: theme.textTheme.subtitle2.copyWith(
                    fontSize: 14.0, fontWeight: FontWeight.w800, height: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
