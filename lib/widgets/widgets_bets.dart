import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class BetCard extends StatelessWidget {
final String matchType;
final String date;
final String time;
final String team;
final String price;
final String status;
final String volume;

BetCard({this.matchType, this.date, this.time, this.team, this.price, this.volume, this.status});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
          color: Color(0xff6c757d),
             borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chip(
                  backgroundColor: Colors.white,
                  avatar: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.solidCircle,
                        color: Colors.green,
                      size: 15,
                      ),
                    ),
                  ),
                  label: Text('$status'),
                  ),
                ],
              ),
              Text('$matchType',
                  style: theme.textTheme.bodyText1.copyWith(fontSize:26.0, fontWeight: FontWeight.bold),
                  ),
                    SizedBox(
                    height: 2.0,
                  ),
                    Text('$date $time',
                         style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),
                 SizedBox(
                    height: 5.0,
                  ),
              Text('$team', style: theme.textTheme.bodyText1.copyWith(fontSize:20, fontWeight: FontWeight.bold),),                               
              SizedBox(
                    height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                // Column(children: [
                //   Row(
                //     children: [
                //       // Container(
                //       // width: 40,
                //       // height: 30,
                //       // decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                //       // color: Color(0xff9C528B),
                //       // ),
                //       // child: Center(child: Text('$price', style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),)),
                //       // SizedBox(width: 8.0,),
                //       Container(
                //       width: 90,
                //       height: 30,
                //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                //       color: Color(0xffD7CDCC),
                //       ),
                //       child: Center(child: Text('$volume',  style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),),)
                //     ],
                //   )
                // ],),
                // Column(children: [
                //   Row(
                //     children: [
                //       // Container(
                //       // width: 40,
                //       // height: 30,
                //       // decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                //       // color: Color(0xff9C528B),
                //       // ),
                //       // child: Center(child: Text('$price', style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),)),
                //       // SizedBox(width: 8.0,),
                //       Container(
                //        width: 90,
                //       height: 30,
                //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                //       color: Color(0xffD7CDCC),
                //       ),
                //       child: Container(child: Center(child: Text('$volume',  style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),)),)
                //     ],
                //   )
                // ],),

                Column(children: [
                  Row(
                    children: [
                      // Container(
                      // width: 40,
                      // height: 30,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                      // color: Color(0xff9C528B),
                      // ),
                      // child: Center(child: Text('$price',  style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),)),
                      // SizedBox(width: 8.0,),
                      Container(
                       width: 100,
                      height: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),
                      color: Color(0xffD7CDCC),
                      ),
                      child: Center(child: Text('$volume', style: theme.textTheme.bodyText2.copyWith(fontSize: 16.0),textAlign: TextAlign.center,),)),
                    ],
                  )
                ],)
              ],)
            ]
          ),
        ),
      ),
    );
  }
}
