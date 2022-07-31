import 'package:flutter/material.dart';
import 'package:gameboard/XOScore.dart';
import 'package:gameboard/dataArguments.dart';

class loginScreen extends StatelessWidget {
static const String routName= 'login Screen';
String player1 = '', player2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login XO game"),),
      body:Container(
        child: Column(
          children: [
            TextField(
              onChanged: (textName){
                player1 = textName;
              },
            ),
            TextField(
              onChanged: (textName){
                player2 = textName;
              },
            ),
            ElevatedButton(onPressed:()=> Navigator.pushNamed(context, XOScore.routName,
                arguments: dataArguments(player1: player1, player2: player2)
            )
                , child: Text("Start game"))
          ],
        ),
      ),
    );
  }
}
