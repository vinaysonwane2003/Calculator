import 'package:flutter/material.dart';

void main(){
  runApp(Calcu());
}
class Calcu extends StatelessWidget {
  const Calcu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int firstNum =0;
  int secondNum =0;
  var output = '';
  var operation = '';
  var result = '';
  onButtonClicked (value)
  {
    if(value == "AC")
    {
      firstNum = 0;
      secondNum = 0;
      output = '';
      result = '';
    }
    else if(value == "+" || value == "-" || value == "x" || value == "/")
    {
      firstNum = int.parse(output);
      operation = value;
      result = '';
    }
    else if(value == "=")
    {
      secondNum = int.parse(output);
      if(operation == "+") {
        result = (firstNum+secondNum).toString();
      }
      if(operation == "-") {
        result = (firstNum-secondNum).toString();
      }
      if(operation == "x") {
        result = (firstNum*secondNum).toString();
      }
      if(operation == "/") {
        result = (firstNum/secondNum).toString();
      }
    }
    else {
      result = int.parse(output+value).toString();
    }setState(() {
      output = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Calculator",
          style: TextStyle(
            fontSize: 25,
            color: Colors.indigoAccent.shade100,
          ),),
      ),
      backgroundColor: Colors.purple.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(output,
                        style: TextStyle(fontSize: 50, color: Colors.indigoAccent.shade100,),),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.indigoAccent.shade100,
              height: 5,
            ),
          ),
          Row(
            children: [
              MyButton("7"), MyButton("8"), MyButton("9"), ColorButton("+")
            ],
          ),
          Row(
            children: [
              MyButton("4"), MyButton("5"), MyButton("6"), ColorButton("-")
            ],
          ),
          Row(
            children: [
              MyButton("1"), MyButton("2"), MyButton("3"), ColorButton("x")
            ],
          ),
          Row(
            children: [
              MyButton("AC"), MyButton("0"), MyButton("."), ColorButton("/")
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.all(15),
                      color: Colors.amber.shade800,
                      child: Text("=", style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                      ),),
                      onPressed: () => onButtonClicked("="),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget MyButton(String name)
  {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            color: Colors.indigoAccent.shade100,
            child: Text("$name", style: TextStyle(
                fontSize: 30
            ),),
            onPressed: () => onButtonClicked(name),
          ),
        ));
  }

  Widget ColorButton(String name)
  {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            color: Colors.amber.shade800,
            child: Text("$name", style: TextStyle(
              color: Colors.white,
                fontSize: 30
            ),),
            onPressed: () => onButtonClicked(name),
          ),
        ));
  }
}

