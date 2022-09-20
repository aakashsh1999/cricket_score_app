// import 'dart:convert';
// import 'package:cric_dice/widgets/trensations_widgets.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import '../../helpers/constants.dart';

// // some code
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List _matches = [];
//   final _channel = WebSocketChannel.connect(
//     Uri.parse('wss://cric-dice-api.herokuapp.com'),
//   );

//   static Future<List> fetchMatchData() async {
//     var response = await http.get(
//         Uri.https('api.babajikijay.com', '/v2/get_newslist'),
//         headers: {'Authorization': '${token}'});
//     var result = convert.jsonDecode(response.body);
//     print(result);
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _channel.sink.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: ShakeTransition(
//           duration: Duration(milliseconds: 1600),
//           child: Row(
//             children: [
//               Icon(
//                 FontAwesomeIcons.diceThree,
//                 size: 22.0,
//                 color: theme.primaryColor,
//               ),
//               SizedBox(width: 5.0),
//               Text(
//                 'Cric Dice',
//                 style: theme.textTheme.headline1.copyWith(
//                   color: theme.primaryColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//           child: StreamBuilder(
//         stream: fetchMatchData().asStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final dataObj = jsonDecode(snapshot.data);
//             print(dataObj);
//             final idx = _matches.indexWhere(
//               (elem) =>
//                   elem['matchInfo']['MatchId'] == dataObj['data']['MatchId'],
//             );
//             if (idx == -1) {
//               if (dataObj['responseType'] == 4) {
//                 _matches.add({'matchInfo': dataObj['data']});
//               }
//             } else {
//               switch (dataObj['responseType']) {
//                 case 4:
//                   _matches[idx]['matchInfo'] = dataObj['data'];
//                   break;

//                 case 5:
//                   _matches[idx]['odiScore'] = dataObj['data'];
//                   break;

//                 case 6:
//                   if (_matches[idx]['testScore']) {
//                     final teamIdx = _matches[idx]['testScore'].indexWhere(
//                       (elem) => elem['Name'] == dataObj['data']['Name'],
//                     );
//                     if (teamIdx == -1) {
//                       _matches[idx]['testScore'].add(dataObj['data']);
//                     }
//                   } else {
//                     _matches[idx]['testScore'] = [dataObj['data']];
//                   }
//                   break;

//                 case 7:
//                   _matches[idx]['overRuns'] = dataObj['data'];
//                   break;

//                 case 8:
//                   _matches[idx]['liveCommentry'] = dataObj['data'];
//                   break;

//                 case 9:
//                   _matches[idx]['marketRateInfo'] = dataObj['data'];
//                   break;

//                 case 10:
//                   _matches[idx]['marketRate'] = dataObj['data'];
//                   break;

//                 case 11:
//                   _matches[idx]['session'] = dataObj['data'];
//                   break;
//               }
//             }

//             var _matchStr = '';
//             _matches.forEach((m) => _matchStr += jsonEncode(m) + '\n\n');
//             return Text('Match Count: ${_matches.length} \n\n $_matchStr');
//             // return ListView.builder(
//             //   itemCount: _matches.length,
//             //   itemBuilder: (BuildContext context, int index) {
//             //     return Column(
//             //       children: [
//             //         ShakeListTransition(
//             //           duration: Duration(milliseconds: 1000),
//             //           child: UICard(_matches[idx]),
//             //         )
//             //       ],
//             //     );
//             //   },
//             // );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//           // return Text(snapshot.hasData ? '${snapshot.connectionState}' : '!');
//         },
//       )),
//     );
//   }
// }
