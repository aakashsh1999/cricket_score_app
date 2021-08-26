import 'package:flutter/material.dart';

class BetDetails extends StatelessWidget {
  final matchData;

  BetDetails({this.matchData});

  void initState() {
    print(matchData);
  }

  @override
  Widget build(BuildContext context) {
    print(matchData);
    return Container(color: Colors.grey,);
  }
}
