import 'package:flutter/material.dart';
import 'package:flutter_list_grid_actuator/menu.dart';

import 'JsonPageList.dart';
import 'ListGridButtons.dart';
import 'color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(221, 226, 239, 1.0),
        title: ListGridButtons(bloc: _bloc),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Menu(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: StreamBuilder<Widget>(
                stream: _bloc.outputStateStream,
                initialData: JsonPageList(),
                builder: (context, snapshot) {
                  return Container(
                    height: 300,
                    width: 535,
                    child: snapshot.data,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}
