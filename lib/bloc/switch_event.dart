part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
}

class OnSwitchPressed extends SwitchEvent {
  final bool switchValue;

  OnSwitchPressed({@required this.switchValue});

  @override
  List<Object> get props => [this.switchValue];
}
