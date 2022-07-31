import 'package:flutter/material.dart';
import 'package:gameboard/Botton.dart';
import 'package:gameboard/dataArguments.dart';

class XOScore extends StatefulWidget {
  static const String routName= 'XOGame';
  @override
  State<XOScore> createState() => _XOScoreState();
}

class _XOScoreState extends State<XOScore> {
  List<String> BoarderState=[
    "","","",
    "","","",
    "","","",
  ];
  String player1Name = '', player2Name ='';
  @override
  Widget build(BuildContext context) {
    var arg = (ModalRoute.of(context)?.settings.arguments) as dataArguments?;
    player1Name = arg?.player1 ?? '';
    player2Name = arg?.player2 ?? '';
    return
      Scaffold(
        appBar: AppBar(
        title: Text("XO Game"),
    ),
    body: Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text( "$player1Name(X)", style: TextStyle(fontSize: 25),),
                    Text('$playerXScore')
                  ],
                ),
                Column(
                  children: [
                    Text("$player2Name (O)", style: TextStyle(fontSize: 25),),
                    Text('$playerOScore')
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Botton(BoarderState[0],onClick,0),
                Botton(BoarderState[1],onClick,1),
                Botton(BoarderState[2],onClick,2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Botton(BoarderState[3],onClick,3),
                Botton(BoarderState[4],onClick,4),
                Botton(BoarderState[5],onClick,5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Botton(BoarderState[6],onClick,6),
                Botton(BoarderState[7],onClick,7),
                Botton(BoarderState[8],onClick,8),
              ],
            ),
          ),
        ],
      ),
    )
      );
  }

  int counter =0;
  int playerXScore=0, playerOScore=0;

  void onClick(int textOnClick){
    if(BoarderState[textOnClick].isEmpty) {
      if (counter % 2 == 0)
        BoarderState[textOnClick] = 'X';
      else
        BoarderState[textOnClick] = 'O';
      counter++;
    }
    if(checkWinner('x')== true){
      playerXScore+=1;
      resetBoarder();
    }
    if(checkWinner('O')==true){
      playerOScore+=1;
      resetBoarder();
    }
    if (counter == 9) resetBoarder();
    setState(() {});
  }

  void resetBoarder(){
    counter =0;
    BoarderState=[
      "","","",
      "","","",
      "","","",
    ];
  }
  bool checkWinner(String playerCode){
    for(int i=0 ;i<9;i+=3){
      if(BoarderState[i+0]== playerCode &&
          BoarderState[i+1]== playerCode &&
          BoarderState[i+2]== playerCode ) return true;
    }
    for(int i=0;i<3;i++){
      if(BoarderState[i+0]== playerCode &&
          BoarderState[i+3]== playerCode &&
          BoarderState[i+6]== playerCode
      )return true;
    }
    if(BoarderState[0]== playerCode &&
        BoarderState[4]== playerCode &&
        BoarderState[8]== playerCode) return true;

    if(BoarderState[2]== playerCode &&
        BoarderState[4]== playerCode &&
        BoarderState[6]== playerCode)return true;
    return false;
  }

}

