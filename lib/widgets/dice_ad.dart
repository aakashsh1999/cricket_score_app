import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiceAd extends StatelessWidget {
  const DiceAd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launch(
          "https://wa.me/+919643358211?text=Hello, I want to register in dice1x.com"),
      // https://sitethemedata.com/sitethemes/dice1x.com/front/logo.png'
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.network(
                    'https://sitethemedata.com/sitethemes/dice1x.com/front/logo.png'),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:
                    Text('India\'s No1 betting id \n24/7 withdrawal & deposit',
                        style: TextStyle(
                          color: Color(0xffCDB46A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text('|',
                    style: TextStyle(
                      color: Color(0xffCDB46A),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text('Try Now',
                    style: TextStyle(
                      color: Color(0xffCDB46A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
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
