import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_list_grid_actuator/JsonPageGrid.dart';

import 'JsonPageList.dart';
import 'JsonPageGrid.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Widget _color = JsonPageList();

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Widget>();
  Stream<Widget> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red)
      _color = JsonPageList();
    else if (event == ColorEvent.event_green)
      _color = JsonPageGrid();
    else
      throw Exception('Wrong Event Type');

    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
