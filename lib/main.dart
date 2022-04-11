import 'package:calcu_vip_flutter/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: backgroundGreyDark,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RowItem('ac', 'ce', '%', '/'),
                      RowItem('7', '8', '9', '*'),
                      RowItem('4', '5', '6', '-'),
                      RowItem('1', '2', '3', '+'),
                      RowItem('00', '0', '.', '='),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// *row item
class RowItem extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  RowItem(
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  );

  bool isOperator(String text) {
    var opeatorList = ['ac', 'ce', '%', '/', '=', '+', '-', '*'];
    for (var item in opeatorList) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: isOperator(text1!)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {},
          child: Text(
            text1!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text2!)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {},
          child: Text(
            text2!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text3!)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {},
          child: Text(
            text3!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text4!)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {},
          child: Text(
            text4!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
      ],
    );
  }
}
