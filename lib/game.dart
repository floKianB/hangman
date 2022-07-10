import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String word = "WORD";
  List<String> correctLetters = [];
  @override

  
  Widget build(BuildContext context) {
    setState((){
      correctLetters = [...word.split('')];
      print(correctLetters);
    });
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical:30),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage("images/6.png"),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    _DisplayWord(word),
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }


  _DisplayWord(word){
    int codedLength = word.length;
    return '__ '*codedLength;
  }
}