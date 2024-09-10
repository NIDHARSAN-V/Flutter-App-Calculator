import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 41, 41, 41),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
            fontFamily: "stencil",
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 27, 27),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: "stencil",
                        fontWeight: FontWeight.w700,
                        fontSize: 70,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )),
            ),
            Row(
              children: <Widget>[
                NumberButton("1"),
                NumberButton("2"),
                NumberButton("3"),
                NumberButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("4"),
                NumberButton("5"),
                NumberButton("6"),
                NumberButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("7"),
                NumberButton("8"),
                NumberButton("9"),
                NumberButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                NumberButton("C"),
                NumberButton("0"),
                NumberButton("="),
                NumberButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget NumberButton(String x) {
    // Check if the button is a symbol or a number
    bool isSymbol =
        x == "+" || x == "-" || x == "x" || x == "/" || x == "=" || x == "C";

    return SizedBox(
      width: 102.5,
      height: 90,
      child: OutlinedButton(
        onPressed: () {
          buttonClicked(x);
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: isSymbol
              ? Colors.orangeAccent
              : Colors.white, // Background color for symbols
          side: BorderSide(
            color: const Color.fromARGB(255, 27, 27, 27),
            width: 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          x,
          style: TextStyle(
            fontSize: 35,
            color: isSymbol ? Colors.white : Colors.black, // Text color
          ),
        ),
      ),
    );
  }

  String res = "";
  String text = "";
  String disp = "";
  int first = 0;
  int second = 0;
  String operator = "";
  void buttonClicked(String x) {
    if (x == "C") {
      text = "";
      res = "";
      first = 0;
      second = 0;
    } else if (x == "+" || x == "-" || x == "x" || x == "/") {
      first = int.parse(text);
      res = "";
      operator = x;
      print(first.toString());
      print(operator);
    } else if (x == "=") {
      second = int.parse(text);
      print(second.toString());
      if (operator == "+") {
        res = (first + second).toString();
      }
      if (operator == "-") {
        res = (first - second).toString();
      }
      if (operator == "x") {
        res = (first * second).toString();
      }
      if (operator == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = text + x;
    }
    setState(() {
      text = res;
    });
  }
}
