import 'package:flutter/material.dart';

import '/core/l10n/l10n.dart';
import '/core/extensions/extensions.dart';
import '/ui/auth/widgets/language_button.dart';

class SelectLanguagesSection extends StatelessWidget {
  const SelectLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Text(
            context.l.intro_subtitle1,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        Text(context.l.select_language),
        const SizedBox(height: 14),
        //LANGUAGE BUTTONS
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: L10n.supportedLocales.map((Locale locale) {
              return LanguageButton(locale: locale);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
