import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: dog(),
      ),
    );

class dog extends StatefulWidget {
  const dog({Key? key}) : super(key: key);

  @override
  _dogState createState() => _dogState();
}

class _dogState extends State<dog> {
  String imageUrl = "";
  @override
  void initState() {
    requestDog();
    super.initState();
  }

  void requestDog() async {
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
        title: Text("Bark Dog!"),
        actions: [
          IconButton(
            onPressed: () {
              requestDog();
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
