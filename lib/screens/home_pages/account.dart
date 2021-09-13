import 'package:cric_dice/localizations/localization_constants.dart';
import 'package:cric_dice/providers/theme_provider.dart';
import 'package:cric_dice/widgets/trensations_widgets.dart';
import 'package:cric_dice/widgets/widgets_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: ShakeTransition(
            duration: Duration(milliseconds: 1600),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.cog,
                  size: 22.0,
                  color: theme.accentColor,
                ),
                SizedBox(width: 5.0),
                Text(
                  'More',
                  style: theme.textTheme.headline1.copyWith(
                    color: theme.accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            children: [
              SizedBox(height: 15),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ShakeTransition(
                duration: Duration(milliseconds: 1200),
                child: CardSelectLanguage(
                  listLanguage: listLanguage,
                  selectedLanguage: _selectedLanguage,
                  onChanged: (val) {
                    setState(() {
                      changeLanguage(val, context);
                      _selectedLanguage = val;
                    });
                  },
                ),
              ),
              //TODO: Dark Mode
              ShakeTransition(
                duration: Duration(milliseconds: 1600),
                child: CardSelectModeApp(
                  isDarkMode: !themeProv.isLightTheme,
                  onChanged: (val) {
                    setState(() {
                      themeProv.changeTheme();
                    });
                  },
                ),
              ),
              Divider(),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  'Support',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 1800),
              //   child: CardTileSettings(
              //     label: 'Check For Updates',
              //     onTap: () {},
              //   ),
              // ),
              ShakeTransition(
                duration: Duration(milliseconds: 1800),
                child: CardTileSettings(
                  label: 'Report A Problem',
                  onTap: () async {
                    await launch(
                        "mailto:cricdiceofficial@gmail.com?subject=Problem Report regarding CricDice");
                  },
                ),
              ),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: CardTileSettings(
                  label: getTranslated(context, 'rate_app'),
                  onTap: () async {
                    await launch(
                        'https://play.google.com/store/apps/details?id=com.skeltoz.cric_dice');
                  },
                ),
              ),
              ShakeTransition(
                duration: Duration(milliseconds: 2400),
                child: CardTileSettings(
                  label: getTranslated(context, 'share_app'),
                  onTap: () async {
                    Share.share(
                        'Check Out CricDice for latest Cricket updates  \nhttps://play.google.com/store/apps/details?id=com.skeltoz.cric_dice');

                  },
                ),
              ),
              // Divider(),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 2000),
              //   child: Text(
              //     'Visit',
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       fontSize: 22.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 2600),
              //   child: CardTileSettings(
              //     label: getTranslated(context, 'twitter'),
              //     icon: FontAwesomeIcons.twitter,
              //     onTap: () async {
              //       const bool isProduction = bool.fromEnvironment('dart.vm.development');
              //       print(isProduction);
                    
              //       // await launch(
              //       //     'https://www.linkedin.com/in/mouad-azul-8061a7176/?originalSubdomain=ma');
              //     },
              //   ),
              // ),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 2800),
              //   child: CardTileSettings(
              //     label: getTranslated(context, 'facebook'),
              //     icon: FontAwesomeIcons.facebookF,
              //     onTap: () async {
              //       // await launch('https://www.facebook.com/mouad.azul');
              //     },
              //   ),
              // ),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 3000),
              //   child: CardTileSettings(
              //     label: getTranslated(context, 'instagram'),
              //     icon: FontAwesomeIcons.instagram,
              //     onTap: () async {
              //       // await launch('https://www.instagram.com/azul_mouad/');
              //     },
              //   ),
              // ),

              Divider(),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: CardTileSettings(
                  label: 'Contact Us',
                  onTap: () async {
                    await launch("mailto:cricdiceofficial@gmail.com");
                  },
                ),
              ),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: CardTileSettings(
                  label: 'Contact Developers',
                  onTap: () async {
                    await launch("mailto:skeltoz.official@gmail.com");
                  },
                ),
              ),
              // Divider(),
              // ShakeTransition(
              //   duration: Duration(milliseconds: 3200),
              //   child: CardTileSettings(
              //     label: getTranslated(context, 'logout'),
              //     icon: FontAwesomeIcons.signOutAlt,
              //     onTap: () {
              //       Get.toNamed('/');
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}
