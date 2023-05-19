import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isturn = true;
  bool finish = false;

  List<String> XorOList = ['', '', '', '', '', '', '', '', ''];

  String Turn = '';
  String winner = '';

  int equal = 0;
  int ScoreX = 0;
  int ScoreO = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundGrey,
        elevation: 0,
        title: Text(
          'Tic Toc Toe',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textAmber,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                ClearGame();
                ScoreO = 0;
                ScoreX = 0;
              },
              icon: Icon(Icons.replay),
              splashRadius: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            getScoreboard(),
            getGridView(),
            getResultButton(),
            SizedBox(
              height: 10.0,
            ),
            getTurn(),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: finish,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: textWhite,
          ),
        ),
        onPressed: () {
          ClearGame();
        },
        child: Text(
          '${winner}play again!',
          style: TextStyle(
            color: textWhite,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget getScoreboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Player O',
              style: TextStyle(
                color: textRed,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$ScoreO',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Player X',
              style: TextStyle(
                color: textGreen,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$ScoreX',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getGridView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (!finish) {
                  onTap(index);
                }
              },
              child: Container(
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    XorOList[index],
                    style: TextStyle(
                        color: XorOList[index] == 'X' ? textGreen : textRed,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      if (XorOList[index] == '') {
        if (isturn) {
          XorOList[index] = 'O';
          equal++;
        } else {
          XorOList[index] = 'X';
          equal++;
        }
        isturn = !isturn;

        CheckWinner();
      }
    });
  }

  void CheckWinner() {
    if (XorOList[0] == XorOList[1] &&
        XorOList[0] == XorOList[2] &&
        XorOList[0] != '') {
      ResultGame(XorOList[0]);
      finish = true;
      if (XorOList[0] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[3] == XorOList[4] &&
        XorOList[3] == XorOList[5] &&
        XorOList[3] != '') {
      ResultGame(XorOList[3]);
      finish = true;
      if (XorOList[3] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[6] == XorOList[7] &&
        XorOList[6] == XorOList[8] &&
        XorOList[6] != '') {
      ResultGame(XorOList[6]);
      finish = true;
      if (XorOList[6] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[0] == XorOList[3] &&
        XorOList[0] == XorOList[6] &&
        XorOList[0] != '') {
      ResultGame(XorOList[0]);
      finish = true;
      if (XorOList[0] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[1] == XorOList[4] &&
        XorOList[1] == XorOList[7] &&
        XorOList[1] != '') {
      ResultGame(XorOList[1]);
      finish = true;
      if (XorOList[1] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[2] == XorOList[5] &&
        XorOList[2] == XorOList[8] &&
        XorOList[2] != '') {
      ResultGame(XorOList[2]);
      finish = true;
      if (XorOList[2] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[2] == XorOList[4] &&
        XorOList[2] == XorOList[6] &&
        XorOList[2] != '') {
      ResultGame(XorOList[2]);
      finish = true;
      if (XorOList[2] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (XorOList[0] == XorOList[4] &&
        XorOList[0] == XorOList[8] &&
        XorOList[0] != '') {
      ResultGame(XorOList[0]);
      finish = true;
      if (XorOList[0] == 'X') {
        ScoreX++;
      } else {
        ScoreO++;
      }
      return;
    }
    if (equal == 9) {
      setState(() {
        winner = 'Draw , ';
      });
    }
  }

  void ClearGame() {
    setState(() {
      finish = false;
      XorOList = ['', '', '', '', '', '', '', '', ''];
      winner = '';
      equal = 0;
    });
  }

  void ResultGame(String win) {
    setState(() {
      winner = 'Winner is $win , ';
    });
  }

  Widget getTurn() {
    if (isturn) {
      Turn = '<< Turn O >>';
    } else {
      Turn = '<< Turn X >>';
    }
    return Text(
      Turn,
      style: TextStyle(
        fontSize: 30.0,
        color: textAmber,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
