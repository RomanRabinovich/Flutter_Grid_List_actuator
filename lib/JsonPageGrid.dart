import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPageGrid extends StatefulWidget {
  @override
  _JsonPageGridState createState() => _JsonPageGridState();
}

class _JsonPageGridState extends State<JsonPageGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                offset: new Offset(10.0, 10.0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(children: [
                              ColoredBox(
                                  child: Container(
                                    height: 100,
                                    width: 140,
                                  ),
                                  color: Colors.black),
                              Row(
                                children: [
                                  SizedBox(height: 5),
                                  Icon(Icons.movie),
                                  Text(showData[index]['empname']),
                                  SizedBox(height: 5),
                                  Text(showData[index]['department']),
                                ],
                              )
                            ]),
                          ),
                        )),
                  );
                },
                itemCount: showData == null ? 0 : showData.length);
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/emprecord.json"),
        ),
      ),
    );
  }
}
