import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  final Locale locale;

  const AppState(this.locale);

  @override
  List<Object> get props => [locale];
}

class AppInitState extends AppState {
  const AppInitState(super.locale);
}

class AppLocaleChangedState extends AppState {
  const AppLocaleChangedState(super.locale);
}

class AppLocaleLoadedState extends AppState {
  const AppLocaleLoadedState(super.locale);
}
