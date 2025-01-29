import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/injection.dart';
import '/ui/auth/state/auth_bloc.dart';
import '/ui/auth/state/auth_event.dart';
import '/core/di/app_config_module.dart';
import '/core/extensions/extensions.dart';

class SocialLogInSection extends StatelessWidget {
  const SocialLogInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            context.l.log_in_info,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => _logInWithGoogle(context),
            child: Text(context.l.google_sign_in),
          ),
        ],
      ),
    );
  }

  Future<void> _logInWithGoogle(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final commonError = context.l.error_occurred;
    try {
      final user = await GoogleSignIn(
        clientId: getIt<AppConfig>().googleClientId,
      ).signIn();
      var authentication = await user?.authentication;

      if (authentication?.idToken == null) return;

      authBloc.add(RegisterUserEvent(authentication!.idToken!));
    } catch (error) {
      log('Google Sign In Error: $error');
      messenger.showSnackBar(
        SnackBar(content: Text(commonError)),
      );
    }
  }
}
