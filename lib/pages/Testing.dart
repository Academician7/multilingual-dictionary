import 'dart:convert';

import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  TextEditingController _type = TextEditingController();
  var langState = "english";
  var type = '';
  var x = {
    "অসম": {"english": "Assam State", "assamese": "অসম state"},
    "অসমী": {"english": "Inhabitants of Assam", "assamese": "অসমor manuh"},
    "অসমত": {"english": "in the State of Assam", "assamese": "অসমot Moi"},
    "assam": {"english": "the state of assam", "assamese": "অসম"},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        langState = "english";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 60,
                      color: colur1(langState),
                      child: Center(
                        child: Text(
                          "ENGLISH",
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        langState = "assamese";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 60,
                      color: colur2(langState),
                      child: Center(
                        child: Text(
                          "ASSAMESE",
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Type the text here"),
            TextFormField(
              controller: _type,
              decoration: InputDecoration(
                  //            errorText: validate ? null : errorText,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ))),
            ),
            Container(
                height: 300,
                width: 300,
                color: Colors.black,
                child: Center(
                  child: return1(type),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    type = _type.text;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 80,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      "PRESS",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  return1(String yeah) {
    if (yeah == "") {
      return Text("Empty", style: TextStyle(fontSize: 30, color: Colors.white));
    } else {
      var y = jsonEncode(x[yeah]);
      var z = jsonDecode(y);
      return Text(
        "${z[langState]}",
        style: TextStyle(color: Colors.white),
      );
    }
  }

  Color colur1(String langState) {
    switch (langState) {
      case 'english':
        return Colors.blue[900];
      case 'assamese':
        return Colors.blue;
    }
  }

  Color colur2(String langState) {
    switch (langState) {
      case 'english':
        return Colors.amber;
      case 'assamese':
        return Colors.amber[800];
    }
  }
}
