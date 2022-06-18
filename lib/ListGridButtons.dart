import 'package:flutter/material.dart';

import 'color_bloc.dart';

class ListGridButtons extends StatelessWidget {
  const ListGridButtons({
    Key? key,
    required ColorBloc bloc,
  })  : _bloc = bloc,
        super(key: key);

  final ColorBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Media',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            width: 180,
          ),
          IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              }),
          SizedBox(
            width: 10,
          ),
          IconButton(
              icon: const Icon(Icons.grid_view),
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_green);
              }),
          LoadFileButton(),
        ],
      ),
    );
  }
}

class LoadFileButton extends StatelessWidget {
  const LoadFileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('UPLOAD FILE'),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(117, 125, 141, 1.0), // background
        onPrimary: Color.fromARGB(255, 222, 222, 221), // foreground
      ),
    );
  }
}
