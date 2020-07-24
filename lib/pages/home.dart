import 'package:cube/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_obj/flutter_3d_obj.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchState = false;
  double rating = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cube'),
      ),
      body: BlocProvider(
        create: (context) => SwitchBloc(),
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Expanded(
              flex: 9,
              child: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (BuildContext context, state) {
                  if (state is SwitchChanged) {
                    if (state.switchState) {
                      return Center(
                        child: ColoredCubeWidget(rating: rating),
                      );
                    } else {
                      return Center(
                        child: WiredCubeWidget(rating: rating),
                      );
                    }
                  }
                  return Center(
                    child: WiredCubeWidget(rating: rating),
                  );
                },
              ),
            ),
            Divider(),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Wire'),
                      BlocBuilder<SwitchBloc, SwitchState>(
                        builder: (context, state) {
                          bool switchVal;
                          if (state is SwitchInitial) {
                            switchVal = state.switchState;
                          } else if (state is SwitchChanged) {
                            switchVal = state.switchState;
                          }
                          return Switch(
                            value: switchVal,
                            onChanged: (value) =>
                                BlocProvider.of<SwitchBloc>(context).add(
                              OnSwitchPressed(switchValue: switchVal),
                            ),
                          );
                        },
                      ),
                      Text('Solid')
                    ],
                  ),
                  Slider(
                    value: rating,
                    onChanged: (value) => setState(() {
                      rating = value;
                    }),
                    min: 30,
                    max: 180,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ColoredCubeWidget extends StatelessWidget {
  const ColoredCubeWidget({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Object3D(
      size: Size(120, 120),
      path: 'assets/new_cube/new_cube.obj',
      asset: true,
      zoom: rating,
    );
  }
}

class WiredCubeWidget extends StatelessWidget {
  const WiredCubeWidget({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Object3D(
      size: Size(120, 120),
      path: 'assets/wired_cube/wired_cube.obj',
      asset: true,
      zoom: rating,
    );
  }
}
