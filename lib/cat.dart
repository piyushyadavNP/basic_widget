import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: cat(),
      ),
    );

class cat extends StatefulWidget {
  const cat({Key? key}) : super(key: key);
  @override
  _catState createState() => _catState();
}

class _catState extends State<cat> {
  String imageUrl = "";
  @override
  void initState() {
    requestCat();
    super.initState();
  }

  void requestCat() async {
    setState(() {
      imageUrl = "";
    });
    var url = Uri.parse('https://aws.random.cat/meow');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      setState(() {
        imageUrl = result["file"];
      });
    }
  }

  Widget getResult() {
    if (imageUrl != "") {
      return Image(
        image: NetworkImage(imageUrl),
        height: 300,
        width: 400,
        fit: BoxFit.cover,
      );
    }
    return Text("Loding...........");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text("Meow Cat!"),
        actions: [
          IconButton(
            onPressed: () {
              requestCat();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: getResult(),
      ),
    );
  }
}
