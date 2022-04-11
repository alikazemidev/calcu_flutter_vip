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
                      RowItem(),
                      RowItem(),
                      RowItem(),
                      RowItem(),
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
  const RowItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: textGrey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            '1',
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
