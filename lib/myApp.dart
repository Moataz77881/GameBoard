import 'package:flutter/material.dart';
import 'package:gameboard/login.dart';

import 'XOScore.dart';

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        XOScore.routName : (BuildContext)=>XOScore(),
        loginScreen.routName: (BuildContext)=> loginScreen()

      },
      initialRoute: loginScreen.routName,
    );
  }
}
