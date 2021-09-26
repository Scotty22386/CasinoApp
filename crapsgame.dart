import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

//Modifed by Scott Wickline
//Source Code give in classs

class CrapsGame extends StatefulWidget {
  const CrapsGame({Key? key}) : super(key: key);

  @override
  _CrapsGameState createState() => _CrapsGameState();
}

class _CrapsGameState extends State<CrapsGame> {
  String _pointMessage = 'Point';
  String _statusMessage = '';

  bool _playBtnEnabled = true;
  bool _rollBtnEnabled = false;

  int _myDie1 = 0;
  int _myDie2 = 0;
  int _myPointDie1 = 0;
  int _myPointDie2 = 0;
  int _myPoint = 0;

  late var _rng;

  void initState() {
    _rng = new Random();
  }

  void _playBtnClicked() {
    setState(() {
      _myDie1 = _rng.nextInt(6) + 1;
      _myDie2 = _rng.nextInt(6) + 1;
      int _sum = _myDie1 + _myDie2;
      money = money - 500;

      switch (_sum) {
        case 7:
        case 11:
          _statusMessage = "You Won!!!";
          _myPointDie1 = 0;
          _myPointDie2 = 0;
          _pointMessage = 'Point';
          money = money + 2000;
          break;
        case 2:
        case 3:
        case 12:
          _statusMessage = "Sorry, You Lose.";
          _myPointDie1 = 0;
          _myPointDie2 = 0;
          _pointMessage = 'Point';
          break;
        default:
          _myPoint = _sum;
          _myPointDie1 = _myDie1;
          _myPointDie2 = _myDie2;
          _pointMessage = "Point is $_myPoint";
          _statusMessage = "Roll Again!";
          _playBtnEnabled = false;
          _rollBtnEnabled = true;
      }
    });
  }

  void _rollBtnClicked() {
    setState(() {
      _myDie1 = _rng.nextInt(6) + 1;
      _myDie2 = _rng.nextInt(6) + 1;
      int _sum = _myDie1 + _myDie2;

      if (_sum == 7) {
        _statusMessage = "Sorry, You Lose.";
        _playBtnEnabled = true;
        _rollBtnEnabled = false;
        _pointMessage = 'Point';
      } else if (_sum == _myPoint) {
        _statusMessage = "You Won!!!";
        _playBtnEnabled = true;
        _rollBtnEnabled = false;
        _pointMessage = 'Point';
        setState(() {});
        money = money + 1000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Craps.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 200, thickness: 7, color: Colors.black12),
              Text(
                _pointMessage,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: _myPointDie1 != 0
                        ? Image.asset(
                      'images/die' + _myPointDie1.toString() + '.png',
                      fit: BoxFit.cover,
                    )
                        : Text(''),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: _myPointDie2 != 0
                        ? Image.asset(
                      'images/die' + _myPointDie2.toString() + '.png',
                      fit: BoxFit.cover,
                    )
                        : Text(''),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      child: Text(
                        'Play',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: _playBtnEnabled ? _playBtnClicked : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: _myDie1 != 0
                        ? Image.asset(
                      'images/die' + _myDie1.toString() + '.png',
                      fit: BoxFit.cover,
                    )
                        : Text(''),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: _myDie2 != 0
                        ? Image.asset(
                      'images/die' + _myDie2.toString() + '.png',
                      fit: BoxFit.cover,
                    )
                        : Text(''),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      child: Text(
                        'Roll',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: _rollBtnEnabled ? _rollBtnClicked : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _statusMessage,
                style: TextStyle(fontSize: 25, color: Colors.white),

              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                child:
                Text('You have $money dollars',
                  style: TextStyle(fontSize: 25, color: Colors.white),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ],
          ),
        )
    );
  }
}