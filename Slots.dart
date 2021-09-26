import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int centerDiceNumber = 1;
  int rightDiceNumber = 1;
  var message = "Spin";

  void DiceFaceChange(){
    setState(() {
      money = money - 500;
      leftDiceNumber= Random().nextInt(6)+1;
      centerDiceNumber= Random().nextInt(6)+1;
      rightDiceNumber= Random().nextInt(6)+1;


    });

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Slots.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          Divider(height: 200, thickness: 7, color: Colors.black12),

          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/dice$leftDiceNumber.png'),
                    )
                ),
                Expanded(
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/dice$centerDiceNumber.png'),
                    )
                ),
                Expanded(
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/dice$rightDiceNumber.png'),
                    )
                ),


              ],
            ),


          ),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    DiceFaceChange();
                    if (leftDiceNumber == centerDiceNumber && leftDiceNumber == rightDiceNumber )
                    {
                      message = "You got a Jackpot";
                      setState(() {
                        money = money + 4000;
                      });
                    }
                    else
                    {
                      message = 'You Lose Try Again';
                    }
                  },
                  );
                },
                child: Text('SPIN'),
              ),

              SizedBox(width: 50,),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),

            ],
          ),

          ),
          Center(
            child:
            SizedBox(
              child:
              Text('You have $money dollars',
                style: TextStyle(fontSize: 25, color: Colors.white),

              ),
            ),
          ),

          Center(
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: Text(message,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          backgroundColor: Colors.black)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}