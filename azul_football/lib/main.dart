import 'package:cric_dice/helpers/constants.dart';
import 'package:cric_dice/screens/home_pages/bottom_nav_screen.dart';
import 'package:cric_dice/screens/user/login.dart';
import 'package:cric_dice/screens/user/register.dart';
import 'package:cric_dice/screens/user/splash.dart';
import 'package:cric_dice/screens/user/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'helpers/theme.dart';
import 'localizations/demo_localizations.dart';
import 'localizations/localization_constants.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, child) {
        return GetMaterialApp(
          title: kAppName,
          debugShowCheckedModeBanner: false,
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          transitionDuration: Duration(milliseconds: 300),
          defaultTransition: Transition.rightToLeftWithFade,
          locale: _locale,
          supportedLocales: kLocaleSupport,
          localizationsDelegates: [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }

            return supportedLocales.first;
          },
          initialRoute: '/',
          routes: {
            '/': (_) => SplashScreen(),
            '/home': (_) => BottomNavScreen(),
          },
        );
      }),
    );
  }
}
