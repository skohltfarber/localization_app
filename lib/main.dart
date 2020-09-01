import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ar', ''), // Arabic, no country code
        const Locale('de', ''), // German, no country code
        const Locale('el', ''), // Greek, no country code
        const Locale('es', ''), // Spanish, no country code
        const Locale('fr', ''), // French, no country code
        const Locale('it', ''), // Itailan, no country code
        const Locale('sk', ''), // Slovakan, no country code
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        // Built-in localization of basic text for material widgets.
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL.
        GlobalWidgetsLocalizations.delegate,
        // Built-in localization of basic text for Cupertino widgets.
        GlobalCupertinoLocalizations.delegate,
      ],
      localeListResolutionCallback: (locale, supportedLocales) {
        print(locale[0].languageCode);
        print(supportedLocales.first);
        for (var supporedLocale in supportedLocales) {
          print(supporedLocale.languageCode);
          if (supporedLocale.languageCode == locale[0].languageCode) {
            return supporedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("title"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).translate("first_string"),
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                AppLocalizations.of(context).translate("second_string"),
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "This will not be translated.",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
