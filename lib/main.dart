import 'package:calcu_vip_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String outPut = '';
  var _result = '';

// *get operator
  bool isOperator(String text) {
    var opeatorList = ['ac', 'ce', '%', '/', '=', '+', '-', '*'];
    for (var item in opeatorList) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  void _showOutPut(String text) {
    setState(() {
      outPut = outPut + text;
    });
  }

// *row item
  Widget _rowItem(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: isOperator(text1)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {
            if (text1 == 'ac') {
              setState(() {
                _result = '';
                outPut = '';
              });
            } else {
              _showOutPut(text1);
            }
          },
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: isOperator(text1) ? textGreen : textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text2)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {
            if (text2 == 'ce') {
              setState(() {
                if (outPut.length > 0) {
                  outPut = outPut.substring(0, outPut.length - 1);
                }
              });
            } else {
              _showOutPut(text2);
            }
          },
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: isOperator(text2) ? textGreen : textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text3)
              ? TextButton.styleFrom(
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {
            _showOutPut(text3);
          },
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: isOperator(text3) ? textGreen : textGrey,
            ),
          ),
        ),
        TextButton(
          style: isOperator(text4)
              ? TextButton.styleFrom(
                  primary: textGreen,
                  backgroundColor: backgroundGreyDark,
                  shape: CircleBorder(),
                )
              : null,
          onPressed: () {
            if (text4 == '=') {
              if (!_result.isEmpty) {
                return;
              }
              var parser = Parser();
              Expression expression = parser.parse(outPut);
              ContextModel contextModel = ContextModel();
              var result =
                  expression.evaluate(EvaluationType.REAL, contextModel);
              setState(() {
                _result = result.toString();
              });
            }
            _showOutPut(text4);
          },
          child: Text(
            text4,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: isOperator(text4) ? textGreen : textGrey,
            ),
          ),
        ),
      ],
    );
  }

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        outPut,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: textGreen,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _result,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 65,
                          color: textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _rowItem('ac', 'ce', '%', '/'),
                      _rowItem('7', '8', '9', '*'),
                      _rowItem('4', '5', '6', '-'),
                      _rowItem('1', '2', '3', '+'),
                      _rowItem('00', '0', '.', '='),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
