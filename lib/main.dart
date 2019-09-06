import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';
  String message = '';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String button) {
    if (button == 'Limpar') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
      message = '';
    } else if (button == '+' ||
        button == '-' ||
        button == '*' ||
        button == '/') {
      num1 = double.parse(output);

      operand = button;
      message = message+button;
      

      _output = output;
    } else if (button == '.') {
      if (_output.contains('.')) {
        print('Já contém um decimal');
        return;
      } else {
        _output = _output + button;
      }
    } else if (button == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
      message = _output.toString();
      
    } else {
      _output = _output + button;
      message = message +button;
    }

    //print(_output);
    //print(operand);
    print(message);

    setState(() {
      output = double.parse(_output).toStringAsFixed(1);
    });
}

Widget buildButton(String buttonText) {
  return new Expanded(
    child: new OutlineButton(
      padding: new EdgeInsets.all(30.0),
      child: new Text(
        buttonText,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => buttonPressed(buttonText),
      textColor: Colors.black,
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(
        children: [
          new Container(
              alignment: Alignment.centerRight,
              padding:
                  new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(
                message,
                style: TextStyle(fontSize: 36.00, fontWeight: FontWeight.bold),
              )),
          new Expanded(
            child: new Divider(),
          ),
          new Column(
            children: [
              new Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/')
                ],
              ),
              new Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*')
                ],
              ),
              new Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-')
                ],
              ),
              new Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+')
                ],
              ),
              new Row(
                children: [
                  buildButton('Limpar'),
                  buildButton('='),
                ],
              ),
            ],
          )
        ],
      )));
}
}