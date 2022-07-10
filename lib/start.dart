import 'package:flutter/material.dart';
import './game.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "images/mainIcon.png",
                    ),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Game() )
                    );
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}