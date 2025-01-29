import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/auth/state/auth_bloc.dart';
import '/ui/auth/state/auth_state.dart';
import '/ui/auth/widgets/social_log_in_section.dart';
import '/ui/auth/widgets/select_languages_section.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (_, current) {
        return current is ScreenChanged || current is GoogleSignInDone;
      },
      builder: (_, state) {
        return switch (state.screenState) {
          IntroScreenState.languageSelection => const SelectLanguagesSection(),
          IntroScreenState.socialLogIn => const SocialLogInSection()
        };
      },
    );
  }
}
