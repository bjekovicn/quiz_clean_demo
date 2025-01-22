import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/auth/state/auth_bloc.dart';
import '/ui/auth/state/auth_event.dart';
import '/ui/auth/state/auth_state.dart';
import '/core/extensions/extensions.dart';

class IntroNavigationButton extends StatelessWidget {
  const IntroNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (_, current) => current is ScreenChanged,
        builder: (_, state) {
          return Row(
            children: [
              //PREVIOUS BUTTON
              if (state.screenState == IntroScreenState.socialLogIn) ...[
                InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    final provider = context.read<AuthBloc>();
                    provider.add(PreviousScreenEvent(state.screenState));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 24),
                        const Icon(Icons.chevron_left),
                        const SizedBox(width: 6),
                        Text(context.l.back),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ),
              ],

              const Spacer(),

              //NEXT BUTTON
              if (state.screenState == IntroScreenState.languageSelection) ...[
                InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    final authBloc = context.read<AuthBloc>();
                    authBloc.add(NextScreenEvent(state.screenState));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 24),
                        Text(context.l.next),
                        const SizedBox(width: 6),
                        const Icon(Icons.chevron_right),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
