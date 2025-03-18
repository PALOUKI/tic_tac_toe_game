import 'package:tic_tac_toe/core/core.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.introPage,
      onGenerateRoute: Routes.onGenerateRoute,

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; // the first player turn O !
  List<String> displayExth = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    AppConfigSize.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text('Joueur X', style: myTextStyle),
                          Text(exScore.toString(), style: myTextStyle),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text('Joueur O', style: myTextStyle),
                          Text(ohScore.toString(), style: myTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Center(
                      child: Text(
                        displayExth[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(child: Container(color: Colors.red)),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExth[index] == '') {
        displayExth[index] = 'O';
        filledBoxes +=1;
      } else if (!ohTurn && displayExth[index] == '') {
        displayExth[index] = 'X';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check 1st row
    if (displayExth[0] == displayExth[1] &&
        displayExth[0] == displayExth[2] &&
        displayExth[0] != '') {
      _showWinnerDialog(displayExth[0]);
    }

    //check 2nd row
    if (displayExth[3] == displayExth[4] &&
        displayExth[3] == displayExth[5] &&
        displayExth[3] != '') {
      _showWinnerDialog(displayExth[3]);
    }

    //check 3rd row
    if (displayExth[6] == displayExth[7] &&
        displayExth[6] == displayExth[8] &&
        displayExth[6] != '') {
      _showWinnerDialog(displayExth[6]);
    }

    //check 1st column
    if (displayExth[0] == displayExth[3] &&
        displayExth[0] == displayExth[6] &&
        displayExth[0] != '') {
      _showWinnerDialog(displayExth[0]);
    }

    //check 2nd Column
    if (displayExth[1] == displayExth[4] &&
        displayExth[1] == displayExth[7] &&
        displayExth[1] != '') {
      _showWinnerDialog(displayExth[1]);
    }

    //check 1st row
    if (displayExth[2] == displayExth[5] &&
        displayExth[2] == displayExth[8] &&
        displayExth[2] != '') {
      _showWinnerDialog(displayExth[2]);
    }

    //check 1st diagonal
    if (displayExth[0] == displayExth[4] &&
        displayExth[0] == displayExth[8] &&
        displayExth[0] != '') {
      _showWinnerDialog(displayExth[0]);
    }

    //check 2nd diagonal
    if (displayExth[2] == displayExth[4] &&
        displayExth[2] == displayExth[6] &&
        displayExth[2] != '') {
      _showWinnerDialog(displayExth[2]);
    }
    else if(filledBoxes == 9){
      _showDrawDialog;
    }
  }



  void _showDrawDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("DRAW"),
          actions: [
            ElevatedButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('rejouer'),
            ),
          ],
        );
      },
    );


  }

  void _showWinnerDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Joueur ' + winner + " a gagné"),
          actions: [
            ElevatedButton(
              style: ButtonStyle(

              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('rejouer'),
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExth[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
