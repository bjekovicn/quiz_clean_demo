import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'initial_set_up_screen.dart';
import '/ui/auth/state/auth_bloc.dart';
import '/ui/auth/state/auth_event.dart';
import '/ui/auth/state/auth_state.dart';
import '/ui/auth/widgets/landing_content.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authBloc = context.read<AuthBloc>();
      authBloc.add(GetSignedInUserEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _listener,
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (_, current) => current is! ScreenChanged,
        builder: (_, state) {
          if (state is Unauthorized) return const InitialSetUpScreen();

          return const LandingContent();
        },
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    // Navigate to the main application page (NavigationPage)
    // This occurs only in two cases:
    // When the user is authenticated for the first time
    // When the user is already signed in and stored in local storage
    if (state is! Authorized && state is! GoogleSignInDone) return;

    //NAVIGATION TO HOME
  }
}
