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
                        return CenterWidget(
                            modelSource: 'assets/cube/cube.obj',
                            rating: rating);
                      }
                    }
                    return CenterWidget(
                        modelSource: 'assets/wired_cube/wired_cube.obj',
                        rating: rating);
                  },
                )),
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
                    max: 90,
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

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key key,
    @required this.modelSource,
    @required this.rating,
  }) : super(key: key);

  final String modelSource;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Object3D(
        size: Size(30, 30),
        path: modelSource,
        asset: true,
        zoom: rating,
      ),
    );
  }
}
