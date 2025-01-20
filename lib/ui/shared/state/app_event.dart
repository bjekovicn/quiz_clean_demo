import 'package:flutter/material.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppEventChangeLocale extends AppEvent {
  final Locale locale;
  AppEventChangeLocale(this.locale);
}

class AppEventLoadLanguageCode extends AppEvent {
  AppEventLoadLanguageCode();
}
