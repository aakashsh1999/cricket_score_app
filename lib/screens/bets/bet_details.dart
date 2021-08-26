import 'package:flutter/material.dart';

class BetDetails extends StatefulWidget {
  final matchData;

  BetDetails({this.matchData});

  @override
  _BetDetailsState createState() => _BetDetailsState();
}

class _BetDetailsState extends State<BetDetails> {
  void initState() {
    print(widget.matchData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.matchData);
    return SingleChildScrollView(
      child: Container(color: Colors.grey,
      child: Text(widget.matchData.toString()),),
    );
  }
}
