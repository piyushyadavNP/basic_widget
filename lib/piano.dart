import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: pianoApp(),
      ),
    );

class pianoApp extends StatelessWidget {
  const pianoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piano App'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
