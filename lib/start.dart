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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      minimumSize: Size(200, 30),
                      primary: Colors.green[300],
                      side: BorderSide(width: 3, color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game() )
                      );
                    },
                    child: Text(
                      "Easy",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600
                      ),
                      ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      minimumSize: Size(200, 30), 
                      primary: Colors.yellow[400],
                      side: BorderSide(width: 3, color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game() )
                      );
                    },
                    child: Text(
                      "Medium",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600
                      ),
                      ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      minimumSize: Size(200, 30),
                      primary: Colors.red[300],
                      side: BorderSide(width: 3, color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game() )
                      );
                    },
                    child: Text(
                      "Hard",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600
                      ),
                      ),
                  ),
                    ]
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
  }


}