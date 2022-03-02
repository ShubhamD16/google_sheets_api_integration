import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r''' {
  "type": "service_account",
  "project_id": "dazzling-sector-342906",
  "private_key_id": "e9130a3972bf03d16bae5eedf413a640a11663e6",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCsvNzn0H+GMVDb\nLLDqyqDhfwhStlBpQazvcx1j52AFCdkYr/FPa9Ulua2Up2SMgG6mVOyBGSJ9Tfdl\nkOjzcB0Pl2umMCMF06tGGwF+nG9Hy5I/L57o96RHGQsUpXev9YWABMTe/gvYvUgW\nW+i9d4cAgrCG71mo5dp+Cq9s96eKdzBAaJkvp+z05apgYvDjieHjQY16gQU2sznz\nbMUFZC2W5/plAKUmIqNT9bZEb71674oIdMp5AKtZNLNDj5V/EyTSCZmNTtuD9Lgz\n8Y5KllF3IXh6ouqqAE0eeVtzew+dGhgsjJtxDA0gOpZ41KQaEjGyjXrqtcCJFqwO\nsFxPyU5lAgMBAAECggEACraB2synBAsN8THh3QXpGWMYAI03CngcwhL5GSeR4G4e\nbTYIOL0+0GKmHciN51rVwfIVYuJMrcnGlKF6mRJ0cvGYpwtoOKXKgwQMwS3xhtnc\nvZd1+wvUv+YRNlwWwq5u86QYE55c3LnMfTqBAjMmB8WTLiMtA9kRhmyiOZdYaDFn\nBrnAoD1sJxnd3JnfmBJLy20ptq8W8hODCJtM6Poue49fsxn1lH5R5L+CTWu2jZzz\ndS2G857hVbihtzOMg2WTdCP/Yj0uXRWIYQGGvaPfStZOPImaEh9kFkzIdEh3WotK\nAKEr1Ro+ew0B8DXTgwQWiVFAej2bUrpTF3yW0QcnFwKBgQDfSGyavd6mPbNwXKFg\nZYCUib8LTvuEdAFnargHgx1NqUxfMGAv4pfO2GM2pKbJJ/XjfmXGrA4pTDtOlvzT\nsMlJQ1U1JlnoZylzuAkb80tgUwGuh94ZBcuas+TPOS75paqElIsyuBEySlVJDVzI\nGkVDt3+NLj5anPUfUccKCwyDhwKBgQDGDG/M0DJfV00fkDJLTrXjRRsELe1jNd0+\nQuX2JVZvM9Aeb2GWleaS6WRDyx4ENQae8Qn/2tB/zu/KyEUNY/cbCDRf+nZQJ7pz\n+MfOIVbpyk1iibCH95FtoBf66ymPzyX58tFq2Mg93CHEorBXpcIPvwsrllsFCAYZ\nlThI4F+xswKBgDAj+1Z5rXGGSBPnxNt1xv0/nbMgelYadNsJRVhJSp4d7FtxoKty\nXWy5dtqnMVaZiQhdjjABlKQOzZKqNySlLyDepZZqCGR1KZjLixs9n3jLLMemf5pB\nh555PtH28EvfDh67sC9lRD/livHPMbvq/hgVjiiwWb1LrgXsqc9ehnotAoGBAK1/\nla3Csm5Np7W/+B97C+LW1m0Z4v3n4TM7HgQ9/3OZ23feMYrfNUh8iCbP2TLsVSmG\nljD7O27MFcv7GGs7qO2YiXGPlHhx5WjViAyvrllPre1mHC1xF4kHGBrsStO+MFHA\ng+9rjDiNEVQXBg8ymkh7H8kGhiRpPBbLX6yQS6T7AoGANU0i81enfa24/v/1aU3+\nhAfZsoIUtjLC1OXPG4u4BYllbhdcK01+sAP/cvQzN9GVb0VF3uH0+rGPySzptEHF\nSTXla7ROkV1FHfLXj4O7sAH6ApzqSxh5y+ZatdcCAO7Wg1RsqvwN6aUEnsgbtKg3\niF8n27o83xxpqgsTbVj7Trs=\n-----END PRIVATE KEY-----\n",
  "client_email":
      "gsheets-testing@dazzling-sector-342906.iam.gserviceaccount.com",
  "client_id": "116378591131662179114",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/gsheets-testing%40dazzling-sector-342906.iam.gserviceaccount.com"
}
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
