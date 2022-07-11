import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int wrongCounter = 0;
  List<String> correctLetters = [];
  List<String> display = [];
  @override
  _GameState(){
    super.initState();
    String word = _GetWord();
    display = List<String>.filled(word.length , '__ ');
    correctLetters = [...word.split('')];
    }
  
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical:40),
                  child: Center(
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage("images/6.png"),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      _DisplayWord(),
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ),
                Container(
                  height: 300,
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: 28,
                      itemBuilder: (BuildContext context, int index) {
                        const List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '?', ';'];
                        return _Keys(index, letters);
                      },
                    ),
                ),
            ],
          ),
        ),
      );
  }


  _DisplayWord(){
    return display.toString();
  }

  Widget _Keys(int index, List<String> letters){
    return (
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        child: Text(
          letters[index],
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          ),
        onPressed: ((){
          _CheckLetter(letters[index]);
        })
      )
    );
  }

  void _CheckLetter(letter){
    if(correctLetters.contains(letter)){
      int correctIndex = correctLetters.indexOf(letter);
      setState((){
        display[correctIndex] = letter;
      });
    } 
  }


  String _GetWord(){
    return "KIAN";
  }
}