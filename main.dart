import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:casino_games/crapsgame.dart';
import 'package:casino_games/Slots.dart';
import 'package:casino_games/game_screen.dart';

int money = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: homepage(),
      );
  }
}


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Casino Games"),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(),
      ),
      body:
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Casino.jpg'),
                  fit: BoxFit.cover)),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Divider(height: 25, thickness: 7, color: Colors.black12),
             ElevatedButton(
               child: Text('Craps'),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => CrapsGame()),
                 );
               },
             ),
             Divider(height: 25, thickness: 7, color: Colors.black12),
             ElevatedButton(
               child: Text('Slots'),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => DicePage()),
                 );
               },
             ),
             Divider(height: 25, thickness: 7, color: Colors.black12),
             ElevatedButton(
               child: Text('Solitaire'),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => GameScreen()),
                 );
               },
             ),
             Divider(height: 25, thickness: 7, color: Colors.black12),

             ElevatedButton(
               child: Text('Add Funds'),
               onPressed: (){
                 setState((){
                   money = money + 1000;
                 });

               },
             ),
             Divider(height: 25, thickness: 7, color: Colors.black12),

             SizedBox(
               child:
                 Text('You have $money dollars',
                 style: TextStyle(fontSize: 25, color:
                 Colors.white),


             ),
             ),
           ],
         ),
        ),
    );
  }
}

class poker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solitaire"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/FeltBackground.jpg"),
                fit: BoxFit.cover)),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

