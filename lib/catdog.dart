import 'package:basic_widget/cat.dart';
import 'package:basic_widget/dog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: catDog(),
      ),
    );

class catDog extends StatefulWidget {
  const catDog({Key? key}) : super(key: key);

  @override
  _catDogState createState() => _catDogState();
}

class _catDogState extends State<catDog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats & Dogs"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Go To Cat Screen',
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.amber,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cat(),
                    ),
                  );
                },
              ),
              RaisedButton(
                color: Colors.indigo,
                child: Text(
                  'Go To Dog Screen',
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.amber,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dog(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
