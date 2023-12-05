import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  //int _currentFloor = 1; // initial floor
  //Offset _position = Offset.zero; // initial position
  //Offset _startPosition = Offset.zero; // start position of the drag
  Offset? _lastFocalPoint; // last recorded focal point, nullable

  void _showFloorSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.filter_1),
                title: Text('Floor 1'),
                onTap: () {
                  setState(() {
                    _currentFloor = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.filter_2),
                title: Text('Floor 2'),
                onTap: () {
                  setState(() {
                    _currentFloor = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.filter_3),
                title: Text('Floor 3'),
                onTap: () {
                  setState(() {
                    _currentFloor = 3;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onScaleStart: (ScaleStartDetails details) {
                _previousScale = _scale;
                _lastFocalPoint = details.focalPoint;
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                  // update scale
                  if (_lastFocalPoint != null) {
                    final offset = details.focalPoint - _lastFocalPoint!;
                    _position += Offset(offset.dx / _scale, offset.dy / _scale);
                  }
                  _lastFocalPoint = details.focalPoint;
                });
              },
              onScaleEnd: (ScaleEndDetails details) {
                _previousScale = 1.0;
                _lastFocalPoint = null;
              },
              child: SvgPicture.asset('Assets/Floor 1.svg')
            ),
          ),
          Positioned(
            top: 40.0,
            left: 10.0,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.zoom_in),
                  onPressed: () {
                    setState(() {
                      _previousScale = _scale;
                      _scale = _scale * 1.1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.zoom_out),
                  onPressed: () {
                    setState(() {
                      _previousScale = _scale;
                      _scale = _scale / 1.1;
                    });
                  },
                ),
              ],
            ),
          ),
          // floor switch button
          Positioned(
            right: 10.0,
            bottom: 10.0,
            child: FloatingActionButton(
              onPressed: _showFloorSelection,
              child: Icon(Icons.layers),
              tooltip: 'Switch Floor',
            ),
          ),
        ],
      ),
    );
  }
}
