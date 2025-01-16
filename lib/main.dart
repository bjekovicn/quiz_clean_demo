import 'package:flutter/material.dart';

import '/injection.dart';
import '/core/l10n/l10n.dart';
import '/gen/assets.gen.dart';
import 'ui/shared/widgets/common_loading.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  configureDependencies();
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
        useMaterial3: true,
        fontFamily: Assets.fonts.sourGummyLight,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.introLogo.path,
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 30),
              const CommonLoading(),
            ],
          ),
        ),
      ),
    );
  }
}
