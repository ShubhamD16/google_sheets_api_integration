import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''

    your Google sheeps credentials.
    
''';

const _spreadsheetId = "1Qv9p1lwlmNzHpJGweJsMLFLSeKiZAqdj66qiR1Dykc4";

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Myhome(),
    );
  }
}

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Get result"),
          onPressed: () async {
            final gsheets = GSheets(_credentials);
            // fetch spreadsheet by its id
            await gsheets.spreadsheet(_spreadsheetId).then((ss) async {
              // get worksheet by its title
              Worksheet? datasheet = ss.worksheetByTitle('DATA');
              Worksheet? resultsheet = ss.worksheetByTitle("RESULT");
              // create worksheet if it does not exist yet
              resultsheet ??= await ss.addWorksheet('RESULT');

              await datasheet!.values.allRows().then((value) {
                if (value.isEmpty || resultsheet == null) {
                  print("No data available");
                } else {
                  int index = 0;
                  int scoreindex = value[0].indexOf("Score");
                  List<List> data = [];
                  for (var v in value) {
                    if (index == 0) {
                      v.add("Result");
                      data.add(v);
                    } else {
                      if (int.parse(v[scoreindex]) > 40) {
                        v.add("pass");
                        data.add(v);
                      } else {
                        v.add("fail");
                        data.add(v);
                      }
                    }
                    index += 1;
                  }
                  resultsheet.values
                      .insertRows(1, data)
                      .whenComplete(() => print("data updated"));
                }
              }).onError((error, stackTrace) {
                print(error.toString());
              });
            }).onError((error, stackTrace) {
              print(error.toString());
            });
          },
        ),
      ),
    );
  }
}
