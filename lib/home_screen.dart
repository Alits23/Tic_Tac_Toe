import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: Text(
          'Tic Toc Toe',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: backgroundGrey,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            getScoreboard(),
            getGridView(),
            getTurn(),
            SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }

  Widget getScoreboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Player O',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '8',
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Player X',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '5',
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getGridView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Container(
                height: 100,
                width: 100,
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

  void onTap(int num) {
    print('object ${num}');
  }

  Widget getTurn() {
    return Text(
      'turn X',
      style: TextStyle(
        fontSize: 30.0,
        color: textWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
