import 'package:flutter/material.dart';

class Botton extends StatelessWidget {
String text;
int index;
Function onClick;
Botton(this.text,this.onClick,this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: ()=>onClick(index),
          child: Text(text, style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
