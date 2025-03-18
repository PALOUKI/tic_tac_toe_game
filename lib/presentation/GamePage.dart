import 'dart:math';

import 'package:tic_tac_toe/core/appConfigSize.dart';
import 'package:tic_tac_toe/core/assetsConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/core.dart';
import 'Widgets/zizagText.dart';

class GamePage extends StatefulWidget {
  GamePage({required this.playerSide, required this.isAi, super.key});
  final bool isAi;
  final String playerSide;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';
  int playerScore = 0;
  int aiScore = 0;
  String playerOneName = 'Moi';
  String playerTwoName = 'IA';

  /*var myTextStyle =  GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      color: Colors.greenAccent,
      fontSize: 32,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
    ),
  );

   */
  var myTextStyle = TextStyle(
    color: Colors.greenAccent,
    fontSize: 32,
    letterSpacing: 2,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.playerSide == 'O' && widget.isAi) {
      currentPlayer = 'O';
      aiMove();
    }
    if (widget.isAi == false) {
      playerOneName = 'X';
      playerTwoName = 'O';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppConfigSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.highPrimary,
      body: Column(
        children: [
          Expanded(flex: 1, child: ZigzagText(text: 'C\'est partie !')),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ZigText(
                          text: playerOneName,
                          color: AppColors.yellowColor,
                          size: getSize(26),
                        ),
                        Card(
                          color: Colors.white30,
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    playerScore.toString(),
                                    style: myTextStyle,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '-',
                                    style: myTextStyle.copyWith(
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    aiScore.toString(),
                                    style: myTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ZigText(
                          text: playerTwoName,
                          color: AppColors.yellowColor,
                          size: getSize(26),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Card(
              color: Colors.white38,
              elevation: 5,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        makeMove(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:
                              Colors
                                  .blueGrey
                                  .shade900,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          /*border: Border.all(
                            color: Colors.grey.shade700,
                            width: 2.0,
                          ),
                           */
                        ),
                        child: Center(
                          child:
                              board[index] == 'X'
                                  ? Image.asset(
                                    AssetsConstants.green_x,
                                    height: getHeight(40),
                                  )
                                  : board[index] == 'O'
                                  ? Image.asset(
                                    AssetsConstants.orange_o,
                                    width: getWidth(76),
                                  )
                                  : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: getHeight(50),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.deepOrangeAccentColor,
                      ),
                      elevation: WidgetStatePropertyAll(10),
                      iconColor: WidgetStatePropertyAll(AppColors.whiteColor),
                      iconSize: WidgetStatePropertyAll(getSize(25)),
                      shadowColor: WidgetStatePropertyAll(AppColors.shadowColor),
                    ),
                    onPressed: _resetBoard,
                    label: Text(
                      'Reprendre',
                      style: AppTextStyles.lightButton.copyWith(
                        fontSize: getSize(18),
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    icon: Icon(Icons.restart_alt_outlined),
                  ),
                ),
                SizedBox(height: getHeight(10)),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: getHeight(50),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.secondary,
                      ),
                      elevation: WidgetStatePropertyAll(10),
                      iconColor: WidgetStatePropertyAll(AppColors.whiteColor),
                      iconSize: WidgetStatePropertyAll(getSize(25)),
                      shadowColor: WidgetStatePropertyAll(AppColors.shadowColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.introPage,
                        arguments: false,
                      );
                    },
                    label: Text(
                      'Quitter',
                      style: AppTextStyles.lightButton.copyWith(
                        fontSize: getSize(18),
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    icon: Icon(Icons.abc),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void aiMove() {
    int bestScore = -9999;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (board[i] == '') {
        board[i] = currentPlayer; // make the mouvement
        int score = minimax(board, 0, false);
        board[i] = ''; // reset the mouvement maked
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove == -1) {
      print('Erreur: Aucun meilleur mouvement trouvé');
      return;
    }

    setState(() {
      board[bestMove] = currentPlayer;
      if (checkWinner(currentPlayer)) {
        winner = currentPlayer;
        aiScore++;
        Future.delayed(Duration.zero, () {
          _showGameResultDialog('$winner a gagné');
        });
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    if (checkWinner('O')) return 10 - depth; // AI win
    if (checkWinner('X')) return depth - 10; // Player win
    if (!board.contains('')) return 0; // AI = Player

    if (isMaximizing) {
      int bestScore = -9999;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O'; // AI play
          int score = minimax(board, depth + 1, false);
          board[i] = '';
          bestScore = max(bestScore, score);
        }
      }
      return bestScore;
    } else {
      int bestScore = 9999;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'X'; // Player play
          int score = minimax(board, depth + 1, true);
          board[i] = '';
          bestScore = min(bestScore, score);
        }
      }
      return bestScore;
    }
  }

  bool checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void makeMove(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
      });

      // Check the victory
      if (checkWinner(currentPlayer)) {
        String winningPlayer = currentPlayer; // keep the winner
        setState(() {
          winner = winningPlayer;
          if (winningPlayer == widget.playerSide) {
            playerScore++;
          } else {
            aiScore++;
          }
        });

        // show game result dialog
        Future.delayed(Duration.zero, () {
          _showGameResultDialog('$winningPlayer a gagné');
        });

        return;
      }

      // Check the equality
      if (!board.contains('')) {
        setState(() {
          winner = 'Draw!';
        });

        // show game result dialog: null
        Future.delayed(Duration.zero, () {
          _showGameResultDialog('Partie nulle');
        });

        return;
      }

      // loading the player
      setState(() {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });

      // move AI if necessary
      if (widget.isAi && currentPlayer != widget.playerSide) {
        aiMove();
      }
    }
  }

  void _showGameResultDialog(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white38,
          title: ZigText(text: message, color: Colors.white, size: getSize(22)),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.greenColor),
              ),
              onPressed: () {
                _resetBoard();
                Navigator.of(context).pop();
              },
              child: ZigText(
                text: 'Rejouer',
                color: Colors.white,
                size: getSize(14),
              ),
            ),
          ],
        );
      },
    );
  }

  void _resetBoard() {
    setState(() {
      board = List.filled(9, '');
      winner = '';
      currentPlayer = widget.playerSide == 'O' ? 'X' : 'X';

      if (widget.playerSide == 'O' && widget.isAi) {
        aiMove();
      }
    });
  }

  Widget ZigText({
    required String text,
    required Color color,
    required double size,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          text.split('').map((char) {
            int index = text.indexOf(char);
            return Transform.rotate(
              angle: index % 2 == 0 ? -0.1 : 0.1, // Rotation zigzag
              child: Text(
                char,
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                    color: color,
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
