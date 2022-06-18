import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPageList extends StatefulWidget {
  @override
  _JsonPageListState createState() => _JsonPageListState();
}

class _JsonPageListState extends State<JsonPageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Row(
                          children: [
                            Icon(Icons.movie),
                            SizedBox(
                              width: 50,
                            ),
                            Text(showData[index]['empname']),
                            SizedBox(
                              width: 50,
                            ),
                            Text(showData[index]['department']),
                          ],
                        ),
                      ])
                    ]),
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
