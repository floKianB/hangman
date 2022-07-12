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
  String word = '';
  @override
  _GameState(){
    super.initState();
    word = _GetWord();
    display = List<String>.filled(word.length , '_');
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
                      image: AssetImage("images/$wrongCounter.png"),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      _DisplayWord(),
                      style: TextStyle(
                        fontSize: 50,
                        color: !display.contains('_') ? Colors.green : wrongCounter >= 6 ? Colors.red : Colors.white,
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
    if(wrongCounter < 6){
      return display.toString().substring(0, display.toString().length-1).substring(1).replaceAll(',', '');
    } else {
      return correctLetters.toString().substring(0, correctLetters.toString().length-1).substring(1).replaceAll(',', '');
    }
  }



  Widget _Keys(int index, List<String> letters){
    return (
      ElevatedButton(
        onPressed: wrongCounter >= 6 ? (){} : ((){
          _CheckLetter(letters[index]);
        }),
        style: ElevatedButton.styleFrom(
          primary: !display.contains('_') ? Colors.green[400] : wrongCounter >= 6 ? Colors.red[400]: Colors.white,
        ),
        child: Text(
          letters[index],
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          ),

      )
    );
  }

  void _CheckLetter(selectedLetter){
    List<int> correctIndexLetters = [];
    int wrongCountes = wrongCounter;

    for(int i = 0; i < correctLetters.length; i++){
      if(selectedLetter == correctLetters[i]){
        correctIndexLetters.add(i);
      } 
    }
    
    List<String> sample = display;
    for(int i = 0; i < correctIndexLetters.length ; i++){
      sample[correctIndexLetters[i]] = selectedLetter;
    }

    if(correctLetters.contains(selectedLetter) == false){
      wrongCountes++;
      setState((){
        display = sample;
        wrongCounter = wrongCountes;
      });
    }

    setState((){
      display = sample;
    });


  }


  String _GetWord(){
    return "APPLE";
  }
}