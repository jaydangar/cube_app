part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();
}

class OnChangeSliderEvent extends SliderEvent {
  final double rating;

  OnChangeSliderEvent({@required this.rating});

  @override
  List<Object> get props => [this.rating];
}
