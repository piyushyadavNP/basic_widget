import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home:Scaffold(appBar:AppBar(title: Text('Dice Game'),
),body: DiceGame(),
),)
  ,);
class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int? imageNo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      diceRoll();
    });
  }
  void diceRoll()
  {
    int random =(Random().nextInt(6))+1;
    setState(() {
      imageNo = random;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Image.asset('assets/dice$imageNo.png',color: Colors.red,width: 300,),
          Container
            (height: 50, width: 250, padding:EdgeInsets.all(10),
            child: OutlinedButton(onPressed: ()=> diceRoll(),child: Text('Roll')
              ,)
            ,)
        ],
      ),
    ),
    );
  }
}
