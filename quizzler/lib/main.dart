import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (quizBrain.isFinished()) {
      Alert(
          context: context,
          type: AlertType.success,
          title: 'Congratulations',
          desc: 'You finished the quiz!',
          buttons: [
            DialogButton(
              child: Text(
                'COOL',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              width: 120,
            )
          ]).show();
      quizBrain.resetQuestions();
      scoreKeeper = [];
    } else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    }
  }

  Expanded button(Color color, String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          onPressed: () {},
          child: Container(
            child: Text(
              answer,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
