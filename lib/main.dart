import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '/injection.dart';
import '/core/l10n/l10n.dart';
import '/gen/assets.gen.dart';
import '/ui/auth/state/auth_bloc.dart';
import '/ui/shared/state/app_bloc.dart';
import '/ui/shared/state/app_event.dart';
import '/ui/auth/screens/landing_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    BlocProvider(
      create: (_) => getIt<AppBloc>()
        ..add(
          AppEventLoadLanguageCode(),
        ),
      child: const MyApp(),
    ),
  );
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
      home: BlocProvider(
        create: (_) => getIt<AuthBloc>(),
        child: const LandingScreen(),
      ),
    );
  }
}
