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
      length: 4,
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            color: Colors.blueGrey.shade100,
            child: TabBar(
              isScrollable: true,
              indicatorColor: theme.primaryColor,
              indicatorWeight: 2.5,
              unselectedLabelColor: theme.primaryColor,
              labelColor: theme.primaryColor,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  text: 'Live Info',
                ),
                Tab(
                  text: 'Top Bids',
                ),
                Tab(
                  text: 'Market Rate',
                ),
                Tab(
                  text: 'Session Rate',
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: TabBarView(children: [
              // Text(widget.matchData.toString()),
              liveInfoTab(),
              topBidsTab(),
              marketRateTab(),
              sessionInfoTab()
            ]),
          ),
        ],
      ),
    );
  }

  Widget topBidsTab() {
    List topBidsData = widget.matchData['marketRateInfo'];
    List<Widget> topBidsView = [];

    Widget styledValues(String value) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Container(
          width: double.maxFinite,
          color: Colors.cyan.shade300,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    Widget styledLabels(String value) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Container(
          width: double.maxFinite,
          color: Colors.cyan.shade800,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    if (topBidsData.length > 0)
      topBidsView.add(Flexible(
        flex: 1,
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 46,
              ),
              styledLabels('Volume'),
              styledLabels('Back'),
              styledLabels('BackVol'),
              styledLabels('Lay'),
              styledLabels('LayVol'),
            ],
          ),
        ),
      ));

    topBidsData.forEach((el) {
      topBidsView.add(Flexible(
        flex: 2,
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  color: Colors.cyan.shade800,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      el['MarketType'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              styledValues(el['Volume'].toString()),
              styledValues(el['Back'].toString()),
              styledValues(el['BackVol'].toString()),
              styledValues(el['Lay'].toString()),
              styledValues(el['LayVol'].toString()),
            ],
          ),
        ),
      ));
    });

    return Row(children: topBidsView);
  }

  Widget marketRateTab() {
    List marketRateData = widget.matchData['marketRate'];
    List<Widget> marketRateView = [];

    marketRateData.forEach((el) {
      List<Widget> backLays = [];
      el['BackLays'].forEach((bl) => {
            backLays.add(Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        width: double.maxFinite,
                        color: Colors.green.shade300,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            bl['Price'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        width: double.maxFinite,
                        color: Colors.green.shade600,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            bl['Volume'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          });

      marketRateView.add(Flexible(
        flex: 1,
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      el['RateType'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: double.maxFinite,
                  color: Colors.green.shade900,
                ),
              ),
              Column(children: backLays),
            ],
          ),
        ),
      ));
    });

    return Row(children: marketRateView);
  }

  Widget liveInfoTab() {
    final basicInfo = widget.matchData['matchInfo'];
    String commentry = basicInfo['Commentry'];
    String last6Balls = '';
    var i = commentry.indexOf('Last 6 balls');
    if (i != -1) {
      last6Balls = commentry.substring(i);
      commentry = commentry.substring(0, i);
    }

    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          width: double.maxFinite,
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Text(
              commentry,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: double.maxFinite,
          color: Colors.blueGrey.shade600,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Text(
              last6Balls,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        // Container(height: 200, child: Text('${widget.matchData}'))
      ],
    );
  }


  Widget sessionInfoTab() {
    final basicInfo = widget.matchData['session'];
     
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          width: double.maxFinite,
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Text(
              basicInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),        // Container(height: 200, child: Text('${widget.matchData}'))
      ],
      
    );
  }
}
