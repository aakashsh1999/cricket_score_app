import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_bets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class BetPage extends StatefulWidget {
  @override
  _BetPageState createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://148.251.21.118:5570'),
  );
    _BetPageState() {
    _channel.sink.add(json.encode({
      'requestType': 1,
      'data': {
        'Firm': 'APITEST',
        'PrivateKey': 'ABHI@1022',
        'ApiKey': 'CRIC@20'
      }
    }));
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: ShakeTransition(
          duration: Duration(milliseconds: 1600),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.diceThree,
                size: 22.0,
                color: theme.primaryColor,
              ),
              SizedBox(width: 5.0),
              Text(
                'Cric Dice',
                style: theme.textTheme.headline1.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data;
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){

            return Column(
              children: [
                ShakeListTransition(
                  duration: Duration(milliseconds: 1600),
                  child: BetCard(
                    matchType:"T20",
                    date: '21 Sep 2021',
                    time: '02:00',
                    team: 'India Vs England',
                    price: '20',
                    volume:'30'
                  )),
                  SizedBox(height: 20.0,)
              ],
            );
          }
          );
          }
            else{
              return Center(child: CircularProgressIndicator());
            }
        },
      )),
    );
  }
}