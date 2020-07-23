import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _offset = Offset(0.5, 0.5);
  bool switchState = false;
  double rating = 30;
  String imageSource = 'lib/assets/frame3.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cube'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(0.01 * _offset.dy)
                ..rotateY(-0.01 * _offset.dx),
              alignment: FractionalOffset.center,
              child: Center(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() => _offset += details.delta);
                  },
                  child: Transform.scale(
                    scale: rating * 0.02,
                    child: Image.asset(imageSource),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Wire'),
                    Switch(
                      value: switchState,
                      onChanged: (value) => setState(
                        () {
                          switchState = value;
                          if (switchState) {
                            imageSource = 'lib/assets/frame2.png';
                          } else {
                            imageSource = 'lib/assets/frame3.png';
                          }
                        },
                      ),
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
                  max: 60,
                  divisions: 60,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
