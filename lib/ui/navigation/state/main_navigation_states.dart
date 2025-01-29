import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationState extends Equatable {
  final int? selectedIndex;
  final Widget? selectedWidget;
  const MainNavigationState({
    required this.selectedIndex,
    required this.selectedWidget,
  });

  @override
  List<Object?> get props => [selectedIndex, selectedWidget];
}

class MainNavigationInitialState extends MainNavigationState {
  const MainNavigationInitialState()
      : super(selectedIndex: null, selectedWidget: null);
}

class MainNavigationLoadedState extends MainNavigationState {
  const MainNavigationLoadedState({
    required super.selectedIndex,
    required super.selectedWidget,
  });

  @override
  List<Object?> get props => [selectedIndex, selectedWidget];
}
