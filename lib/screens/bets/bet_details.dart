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
            height: MediaQuery.of(context).size.height * 0.5,
            child: TabBarView(children: [
              topBidsTab(),
              Text(widget.matchData['marketRate'].toString()),
            ]),
          ),
          // Text(widget.matchData.toString()),
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

  List<Text> getMapList(Map m) {
    List<Text> mapList = [];

    //   for (var k in m.keys) {
    //   // print("Key : $k, value : ${numMap[k]}");
    //   mapList.add(Text(k+':'));
    //     mapList.add(Text(m[k]));
    // }
    m.forEach((k, v) {
      mapList.add(Text(k));
      mapList.add(Text(v.toString()));
    });
    return mapList;
  }

  Widget topBidsTab() {
    var matchData = widget.matchData['marketRateInfo'].length == 0 ||
            widget.matchData['marketRateInfo'] == null
        ? {}
        : widget.matchData['marketRateInfo'][0];
    return Column(
      children: [
        Text(widget.matchData['marketRateInfo'].toString()),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: getMapList(matchData).length,
            itemBuilder: (context, index) {
              return getMapList(matchData)[index];
            },
          ),
        ),
      ],
    );
  }
}
