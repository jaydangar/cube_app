part of 'switch_bloc.dart';

abstract class SwitchState extends Equatable {
  const SwitchState();
}

class SwitchInitial extends SwitchState {
  final bool switchState = false;

  @override
  List<Object> get props => [this.switchState];
}

class SwitchChanged extends SwitchState {
  final bool switchState;

  SwitchChanged({@required this.switchState});

  @override
  List<Object> get props => [this.switchState];
}
