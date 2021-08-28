import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BetDetails extends StatefulWidget {
  final matchData;

  BetDetails({this.matchData});

  @override
  _BetDetailsState createState() => _BetDetailsState();
}

class _BetDetailsState extends State<BetDetails> with TickerProviderStateMixin {
  TabController tc;
  void initState() {
    super.initState();
    tc = TabController(length: 4, vsync: this);
  }

  var sizeList = [0.4, 0.3, 0.3, 0.4];

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
              controller: tc,
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
            height: 
                 MediaQuery.of(context).size.height * sizeList[tc.index]
                ,
            child: TabBarView(controller: tc,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  liveInfoTab(),
                  topBidsTab(),
                  marketRateTab(),
                  sessionInfoTab(),
                ]),
          ),
        ],
      ),
    );
  }

  Widget topBidsTab() {
    List topBidsData = widget.matchData['marketRateInfo'];
    List<Widget> topBidsView = [];
    if (topBidsData == null || topBidsData.length == 0) {
      return Center(
          child: Text(
        'Top Bids Not Available.',
        style: TextStyle(fontSize: 22),
      ));
    }
    Widget styledValues(String value) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.teal.shade700,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      );
    }

    Widget styledLabels(String value) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.cyan.shade800,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                height: 8,
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
    if (marketRateData == null || marketRateData.length == 0) {
      return Center(
          child: Text(
        'Market Rate Not Available.',
        style: TextStyle(fontSize: 22),
      ));
    }
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
                        decoration: BoxDecoration(
                          color: Color(0xff519872),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            bl['Price'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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
                        decoration: BoxDecoration(
                          color: Color(0xff3B5249),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            bl['Volume'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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
                  decoration: BoxDecoration(
                    color: Color(0xff382933),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
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
    final theme = Theme.of(context);
    final basicInfo = widget.matchData['matchInfo'];
    // print(basicInfo);
    if (basicInfo["Commentry"] == null || basicInfo["Commentry"].length == 0) {
      return Center(
          child: Text(
        'Live Info Not Available.',
        style: TextStyle(fontSize: 22),
      ));
    }
    String commentry = basicInfo['Commentry'];
    String last6Balls = '';
    var i = commentry.indexOf('Last 6 balls');
    if (i != -1) {
      last6Balls = commentry.substring(i + 14);
      commentry = commentry.substring(0, i);
    }
    return Column(children: [
      // SizedBox(height: 5),
      Container(
        color: theme.secondaryHeaderColor,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Text(commentry,
              textAlign: TextAlign.center, style: theme.textTheme.headline2),
        ),
      ),
      SizedBox(height: 5),
      Container(
        // color: theme.secondaryHeaderColor,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                  child: Text(
                      i == -1 ? "Balls Not Available" : "Last 6 Balls :",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1
                      // TextStyle(
                      //   color: theme.primaryColor,
                      //   fontWeight: FontWeight.w700,
                      //   fontSize: 16,
                      // ),
                      ),
                ),
              ),
            ),
            for (int i = 0; i < last6Balls.length; i++)
              if (last6Balls[i] != " ")
                Text(
                  last6Balls[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    if (!(widget.matchData["overRuns"]['OverNo'] == null ||
                        widget.matchData["overRuns"]['OverNo'] == ""))
                      Center(
                        child: Text(
                          widget.matchData["overRuns"]['OverNo'] == null ||
                                  widget.matchData["overRuns"]['OverNo'] == ""
                              ? ""
                              : "Over: " +
                                  widget.matchData["overRuns"]['OverNo']
                                      .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            "Teams",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Runs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              OverRun(
                color: Colors.blueGrey.shade600,
                value: widget.matchData["overRuns"]['T1'] ?? "--".toString(),
              ),
              OverRun(
                color: Colors.blueGrey.shade600,
                value:
                    widget.matchData["overRuns"]['T1Runs'] ?? "--".toString(),
              ),
            ],
          ),
          Row(children: [
            OverRun(
              color: Colors.blueGrey.shade600,
              value: widget.matchData["overRuns"]['T2'] ?? "--".toString(),
            ),
            OverRun(
              color: Colors.blueGrey.shade600,
              value: widget.matchData["overRuns"]['T2Runs'] ?? "--".toString(),
            ),
          ]),
        ]),
      )
    ]);
  }

  Widget sessionInfoTab() {
    final basicInfo = widget.matchData['session'];
    if (basicInfo == null) {
      return Center(
          child: Text(
        'Sessions Not Available.',
        style: TextStyle(fontSize: 22),
      ));
    }
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Text(
              basicInfo["Name"] ?? "--".toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Container(
              width: double.maxFinite,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xff2D132C),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      'YES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'NO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            SessionRate(
              color: Color(0xff801336),
              rate: basicInfo['Yes'] ?? "--".toString(),
            ),
            SessionRate(
              color: Color(0xffC72C41),
              rate: basicInfo['No'] ?? "--".toString(),
            ),
          ],
        ),
        Row(
          children: [
            SessionRate(
              color: Color(0xff801336),
              rate: basicInfo['YesValue'] ?? "--".toString(),
            ),
            SessionRate(
              color: Color(0xffC72C41),
              rate: basicInfo['NoValue'] ?? "--".toString(),
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Text(
              basicInfo["Status"] == "" || basicInfo["Status"] == null
                  ? ""
                  : "Status: " + (basicInfo["Status"] ?? "--".toString()),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class SessionRate extends StatelessWidget {
  final String rate;
  final Color color;

  SessionRate({this.color, this.rate});
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          width: double.maxFinite,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                rate,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OverRun extends StatelessWidget {
  final String value;
  final Color color;
  OverRun({this.value, this.color});
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

// class WidgetSize extends StatefulWidget {
//   final Widget child;
//   final Function onChange;

//   const WidgetSize({
//     Key key,
//     @required this.onChange,
//     @required this.child,
//   }) : super(key: key);

//   @override
//   _WidgetSizeState createState() => _WidgetSizeState();
// }

// class _WidgetSizeState extends State<WidgetSize> {
//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
//     return Container(
//       key: widgetKey,
//       child: widget.child,
//     );
//   }

//   var widgetKey = GlobalKey();
//   var oldSize;

//   void postFrameCallback(_) {
//     var context = widgetKey.currentContext;
//     if (context == null) return;

//     var newSize = context.size;
//     if (oldSize == newSize) return;

//     oldSize = newSize;
//     widget.onChange(newSize);
//   }
// }
