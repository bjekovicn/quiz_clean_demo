import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/injection.dart';
import '/ui/auth/state/auth_bloc.dart';
import '/ui/auth/state/auth_event.dart';
import '/core/di/app_config_module.dart';
import '/core/extensions/extensions.dart';

class SignInContent extends StatelessWidget {
  static const routeName = 'auth';
  const SignInContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            const Icon(Icons.info_outline),
            const SizedBox(height: 10),
            Text(
              context.l.google_sign_in_info,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => _logInWithGoogle(context),
              child: Text(context.l.google_sign_in),
            ),
          ],
        ),
      ),
    );
  }

  void _logInWithGoogle(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    try {
      final user = await GoogleSignIn(
        clientId: getIt<AppConfig>().googleClientId,
      ).signIn();
      var authentication = await user?.authentication;

      if (authentication?.idToken == null) {
        throw Exception('Auth data is null!');
      }

      authBloc.add(RegisterUserEvent(authentication!.idToken!));
    } catch (error) {
      log('Google Sign In Error: $error');
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Something went wrong!'),
        ),
      );
    }
  }
}
