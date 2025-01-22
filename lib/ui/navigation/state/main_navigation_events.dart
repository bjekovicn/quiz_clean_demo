import 'package:equatable/equatable.dart';

abstract class MainNavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectTabEvent extends MainNavigationEvent {
  final int index;

  SelectTabEvent(this.index);

  @override
  List<Object> get props => [index];
}
