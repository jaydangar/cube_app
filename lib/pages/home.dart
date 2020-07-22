import 'package:cube/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Offset _offset = Offset(0, 0);

    return BlocProvider(
      create: (context) => SliderBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cube'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<SliderBloc, SliderState>(
                  builder: (context, state) {
                double rating = 30;
                if (state is SliderChange) {
                  rating = state.sliderRating;
                }
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(0.01 * _offset.dy)
                    ..rotateY(-0.01 * _offset.dx),
                  alignment: FractionalOffset.center,
                  child: GestureDetector(
                    onPanUpdate: (details) =>
                        setState(() => _offset += details.delta),
                    onDoubleTap: () =>
                        setState(() => _offset = Offset(0.2, 0.6)),
                    child: Center(
                      child: Transform.scale(
                        scale: rating * 0.02,
                        child: Image.asset('lib/assets/frame.png'),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  double rating = 30;
                  if (state is SliderChange) {
                    rating = state.sliderRating;
                  }
                  return Slider(
                    value: rating,
                    onChanged: (value) => BlocProvider.of<SliderBloc>(context)
                        .add(OnChangeSliderEvent(rating: value)),
                    min: 30,
                    max: 60,
                    divisions: 60,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
