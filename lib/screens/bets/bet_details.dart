import 'package:flutter/material.dart';

class BetDetails extends StatefulWidget {
  final matchData;

  BetDetails({this.matchData});

  @override
  _BetDetailsState createState() => _BetDetailsState();
}

class _BetDetailsState extends State<BetDetails> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: theme.primaryColor,
            unselectedLabelColor: theme.primaryColor,
            labelColor: theme.primaryColor,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            tabs: [
              Tab(
                text: 'Top Bids',
              ),
              Tab(
                text: 'Market Rate',
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(children: [
              Text(widget.matchData['marketRateInfo'].toString()),
              Text(widget.matchData['marketRate'].toString()),
            ]),
          ),
          Text(widget.matchData.toString()),
        ],
      ),
      // child: Column(
      //   children: [
      //     Text(
      //       'Market Rate',
      //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      //       textAlign: TextAlign.center,
      //     ),
      //     TabBarView(
      //       children: [
      //         Text(widget.matchData.toString()),
      //         Text(widget.matchData.toString()),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
