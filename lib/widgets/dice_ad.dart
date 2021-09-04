import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiceAd extends StatelessWidget {
  const DiceAd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launch("https://wa.me/+918285631499?text=Hello"),
      // https://sitethemedata.com/sitethemes/dice1x.com/front/logo.png'
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  'https://sitethemedata.com/sitethemes/dice1x.com/front/logo.png'),
              Text('Try Now',
                  style: TextStyle(
                    color: Color(0xffCDB46A),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
        // color: Colors.green,
        height: 55,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}