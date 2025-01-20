import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/shared/state/app_bloc.dart';
import '/ui/shared/state/app_state.dart';
import '/ui/shared/state/app_event.dart';
import '/core/extensions/extensions.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.locale,
  });
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (_, state) {
        return InkWell(
          onTap: () => _changeLanguage(context, locale),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(8),
              color: state.locale == locale
                  ? Colors.purple.withValues(alpha: 0.2)
                  : Colors.transparent,
            ),
            child: Row(
              children: [
                Radio<Locale>(
                  value: locale,
                  groupValue: state.locale,
                  onChanged: (Locale? locale) {
                    _changeLanguage(context, locale);
                  },
                ),
                Text(locale.fullName),
                const SizedBox(width: 16)
              ],
            ),
          ),
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale? value) {
    if (value == null) return;
    final bloc = context.read<AppBloc>();
    bloc.add(AppEventChangeLocale(value));
  }
}
