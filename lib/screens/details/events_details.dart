import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: theme.primaryColorDark,
            automaticallyImplyLeading: false,
            title: Text(
              'India Vs Pakistan',
              style: TextStyle(fontSize: 18.0),
            ),
            centerTitle: false,
            actions: [
              IconButton(onPressed: (){

              }, 
              icon:Icon(FontAwesomeIcons.chevronRight),
              color: Colors.white,
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5.0,

              tabs: [
                Tab(text: "Info"),
                Tab(text: "Live"),
                Tab(text: "Scorecard"),
                Tab(text:'History'),
                Tab(text:'Points Table'),
              ],
            ),
          ),
     body:
          TabBarView(children: [
            Text('Info'),
            Text('Live'),
            Text('ScoreCard'),
            Text('History'),
            Text('Points Table'),

          ],)
      )
    );
  }
}

class CardTabsEvents extends StatelessWidget {
  final children;

  CardTabsEvents({@required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.primaryColorDark.withOpacity(0.0),
            theme.primaryColorDark,
            theme.primaryColorDark,
          ],
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
