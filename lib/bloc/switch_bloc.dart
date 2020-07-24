import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial());

  @override
  Stream<SwitchState> mapEventToState(
    SwitchEvent event,
  ) async* {
    if (event is OnSwitchPressed) {
      yield SwitchChanged(switchState: !event.switchValue);
    }
  }
}
