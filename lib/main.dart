import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavha_flutter_challenge/screens/HomeScreen.dart';
import 'package:mavha_flutter_challenge/constants.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: 'My List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(



        primarySwatch: Colors.amber,
        primaryColorDark: Colors.amber,
        primaryColor: Colors.amberAccent,
        primaryColorLight: Colors.amber.withOpacity(.1),

      ),

      home: HomeScreen(),
    );
  }
}
