import 'package:flutter/material.dart';

import '/core/l10n/l10n.dart';
import '/gen/assets.gen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.configuration,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: Assets.fonts.sourGummyLight),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Image.asset(
              Assets.images.introLogo.path,
            ),
          ],
        ),
      ),
    );
  }
}
