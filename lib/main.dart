import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreMarker = [];

  List questions = [
    {"question": "Corona is real?", "answer": true},
    {
      "question": "Corona virus attacks the respiratory system?",
      "answer": true
    },
    {"question": "Corona is air borne?", "answer": false},
    {"question": "Corona can be gotten by touch?", "answer": true},
  ];

  int qNum = 0;

  void moveToNextQuestion(bool userAnswer) {
    if (qNum < questions.length) {
      if (questions[qNum]['answer'] == userAnswer) {
        scoreMarker.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else if (questions[qNum]['answer'] != userAnswer) {
        scoreMarker.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      ++qNum;
    } else {
      qNum = 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[qNum < questions.length ? qNum : questions.length - 1]
                    ['question'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  moveToNextQuestion(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  moveToNextQuestion(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreMarker,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
