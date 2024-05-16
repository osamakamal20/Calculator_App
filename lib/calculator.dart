import 'package:calculator/components.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        answer.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(
                          title: "AC",
                          onPress: () {
                            userInput = "";
                            answer = "";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "+/-",
                          onPress: () {
                            userInput += "+/-";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "%",
                          onPress: () {
                            userInput += "%";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "/",
                          onPress: () {
                            userInput += "/";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "7",
                          onPress: () {
                            userInput += "7";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "8",
                          onPress: () {
                            userInput += "8";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "9",
                          onPress: () {
                            userInput += "9";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "*",
                          onPress: () {
                            userInput += "*";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "4",
                          onPress: () {
                            userInput += "4";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "5",
                          onPress: () {
                            userInput += "5";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "6",
                          onPress: () {
                            userInput += "6";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "-",
                          onPress: () {
                            userInput += "-";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "1",
                          onPress: () {
                            userInput += "1";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "2",
                          onPress: () {
                            userInput += "2";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "3",
                          onPress: () {
                            userInput += "3";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "+",
                          onPress: () {
                            userInput += "+";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "0",
                          onPress: () {
                            userInput += "0";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: ".",
                          onPress: () {
                            userInput += ".";
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "DEL",
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        SizedBox(width: 12),
                        Button(
                          title: "=",
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
