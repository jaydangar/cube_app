import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial());

  @override
  Stream<SliderState> mapEventToState(
    SliderEvent event,
  ) async* {
    if (event is OnChangeSliderEvent) {
      yield SliderChange(sliderRating: event.rating);
    }
  }
}
