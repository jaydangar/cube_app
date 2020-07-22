part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {
  const SliderState();
}

class SliderInitial extends SliderState {
  @override
  List<Object> get props => [];
}

class SliderChange extends SliderState {
  final double sliderRating;

  SliderChange({@required this.sliderRating});

  @override
  List<Object> get props => [this.sliderRating];
}
