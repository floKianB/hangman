import 'package:flutter/material.dart';
import './game.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  String selectedWord = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "images/mainIcon.png",
                      ),
                    ),
                ),

                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      selectedWord,
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: 28,
                    itemBuilder: (BuildContext context, index){
                        const List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '<', '✔️'];
                      return _Keys(index, letters);
                    })
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

    Widget _Keys(int index, List<String> letters){
    return (
      ElevatedButton(
        onPressed: (){
          if(letters[index] == '<'){
            setState((){
              selectedWord = selectedWord.length != 0 ? selectedWord.substring(0, selectedWord.length-1) : selectedWord;
            });
          } else if (letters[index] == '✔️') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game(word: "KIAN") )
              );

          } else {
            setState((){
              selectedWord += letters[index];
            });
          }
          
        },
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

      )
    );
  }
}