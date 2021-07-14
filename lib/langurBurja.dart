import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: langurBurja(),
      ),
    );

class langurBurja extends StatefulWidget {
  const langurBurja({Key? key}) : super(key: key);

  @override
  _langurBurjaState createState() => _langurBurjaState();
}

enum Dice {
  CLUB,
  KING,
  HEART,
  DIAMOND,
  FLAG,
  SPADE,
}

class _langurBurjaState extends State<langurBurja> {
  Dice? SelectedDice;
  @override
  List<Dice> results = [];
  void burjaRoll() {
    results = [];
    for (int i = 0; i < 6; i++) {
      Random random = Random();
      int choice = random.nextInt(6) + 1;
      Dice? result = getDiceFromNum(choice);
      results.add(result!);
    }
  }

  Dice? getDiceFromNum(int value) {
    switch (value) {
      case 1:
        return Dice.CLUB;
        break;
      case 2:
        return Dice.KING;
        break;
      case 3:
        return Dice.HEART;
        break;
      case 4:
        return Dice.DIAMOND;
        break;
      case 5:
        return Dice.FLAG;
        break;
      case 6:
        return Dice.SPADE;
        break;
      default:
        return Dice.SPADE;
        break;
    }
  }

  String CheckWin() {
    for (int i = 0; i < results.length; i++) {
      if (SelectedDice == results[i]) {
        return "WON!!!";
      }
    }
    return "LOSE";
  }

  List<Expanded> getResultInDisplay() {
    List<Expanded> displayResults = [];
    for (int i = 0; i < results.length; i++) {
      displayResults.add(
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Image(
                image: AssetImage(
                  getAssetFactory(results[i]),
                ),
              )),
        ),
      );
    }
    return displayResults;
  }

  String getAssetFactory(Dice dice) {
    switch (dice) {
      case Dice.CLUB:
        return "assets/clubs.png";
        break;
      case Dice.KING:
        return "assets/kings.png";
        break;
      case Dice.HEART:
        return "assets/heart.png";
        break;
      case Dice.DIAMOND:
        return "assets/diamond.png";
        break;
      case Dice.FLAG:
        return "assets/flag.png";
        break;
      case Dice.SPADE:
        return "assets/spade.png";
        break;
      default:
        return "assets/clubs.png";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Langur Burja'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.CLUB
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            SelectedDice = Dice.CLUB;
                          },
                        );
                      },
                      child: Image(
                        image: AssetImage('assets/clubs.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.KING
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          SelectedDice = Dice.KING;
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/kings.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.HEART
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          SelectedDice = Dice.HEART;
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/heart.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.DIAMOND
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          SelectedDice = Dice.DIAMOND;
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/diamond.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.FLAG
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          SelectedDice = Dice.FLAG;
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/flag.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: SelectedDice == Dice.SPADE
                            ? Colors.green
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          SelectedDice = Dice.SPADE;
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/spade.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: getResultInDisplay(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: SelectedDice != null ? true : false,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          burjaRoll();
                        });
                      },
                      child: Text(
                        'Roll Dice',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: results.length > 0 ? true : false,
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: Colors.cyan,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CheckWin(),
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  print(
                    'Restart',
                  );
                },
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      SelectedDice = null;
                      results = [];
                    });
                  },
                  child: Text(
                    'Restart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
