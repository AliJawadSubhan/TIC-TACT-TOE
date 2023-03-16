import 'package:flutter/material.dart';

main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> displayXorO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool turnSwap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: GridView.builder(
          itemCount: displayXorO.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                    displayXorO[index],
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  tapped(int index) {
    setState(() {
      if (turnSwap && displayXorO[index] == "") {
        displayXorO[index] = "O";
      } else if (!turnSwap && displayXorO[index] == "") {
        displayXorO[index] = "X";
      }
      turnSwap = !turnSwap;
      checkWinner();
      // displayXorO = ;
    });
  }

  checkWinner() {
    // This checks first row
    if (displayXorO[0] == displayXorO[1] &&
        displayXorO[0] == displayXorO[2] &&
        displayXorO[0] != '') {
      showWinDialog(displayXorO[0]);
    }
    // This checks sec row
    if (displayXorO[3] == displayXorO[4] &&
        displayXorO[3] == displayXorO[5] &&
        displayXorO[3] != '') {
      showWinDialog(displayXorO[3]);
    }
    // This checks third row
    if (displayXorO[6] == displayXorO[7] &&
        displayXorO[6] == displayXorO[8] &&
        displayXorO[6] != '') {
      showWinDialog(displayXorO[6]);
    }
// This checks first Column
    if (displayXorO[0] == displayXorO[3] &&
        displayXorO[0] == displayXorO[6] &&
        displayXorO[0] != '') {
      showWinDialog(displayXorO[0]);
    }

// This checks second Column

    if (displayXorO[1] == displayXorO[4] &&
        displayXorO[1] == displayXorO[7] &&
        displayXorO[1] != '') {
      showWinDialog(displayXorO[1]);
    }
// This checks third Column
    if (displayXorO[2] == displayXorO[5] &&
        displayXorO[2] == displayXorO[8] &&
        displayXorO[2] != '') {
      showWinDialog(displayXorO[2]);
    }

    if (displayXorO[0] == displayXorO[4] &&
        displayXorO[0] == displayXorO[8] &&
        displayXorO[0] != '') {
      showWinDialog(displayXorO[0]);
    }
    if (displayXorO[6] == displayXorO[4] &&
        displayXorO[6] == displayXorO[2] &&
        displayXorO[6] != '') {
      showWinDialog(displayXorO[6]);
    }
  }

  showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    displayXorO = [
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                    ];
                  });
                  Navigator.pop(context);
                },
                child: Text('Play Again'))
          ],
          title: Text('Winner: ' + winner),
        );
      },
    );
  }
}
