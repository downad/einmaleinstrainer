/*
App:
    einmaleins Trainer
file:
    questionManager.dart

Copyright (c) 2019
ralf Weinert <downad@freenet.de>
Source Code:
https://github.com/downad/flutter_einmaleins
License: GPLv2.1

*/

import 'package:flutter/material.dart';

import './questionList.dart';
import './questionManagerGlobals.dart';
import './questionValue.dart';

class QuestionManager extends StatefulWidget {
  bool tryToSolveQuestion = false;
  bool solvedQuestion = false;
  Color raisedButtonColor = Colors.lightBlue;
  int playerCounter = 0;

  final String questionRubrik;

  QuestionManager(this.questionRubrik) {
    print('[AbfrageManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[AbfrageManager Widget] createState');
    return _QuestionManagerState();
  }
}

class _QuestionManagerState extends State<QuestionManager> {
  // Counter für die Fragen
  int questionNumber = 0;

  // Wie soll die Lösung angezeigt werden?
  // 0 = nicht zeigen,
  // 1 = richtige Lösung zeigen,
  // 2 = falsch, Lösung zeigen
  int showSolution = 0;

  //
  QuestionManagerGlobals QUESTGLOBAL = new QuestionManagerGlobals();
  Question mathQuestion = new Question();
  QuestionValue Quest = new QuestionValue(['05022019','1','2','3','4','5','Start','Start','Start','Start']);

  /*
  //                  [Rubrik, Thema, Aufgaben, Richtige Lösung, Erklärung, Korreckte Antwort, L1, L2, L3, L4
  //                  0         1       2           3               4           5               6   7   8   9
  List<String> questionAnswerSolution;
  String questionType;  // *1* = 'mathe'
  String questionBlock; // *2* = 'Einmaleins 5- Reihe'
  String question;      // *3* = '10 * 5', die Aufgabe
  String correctAnswer; // *5* = '1', die richtige Lösung
  List<String> solutionText = [];

  List<String> solution = [];
*/

  _QuestionManagerState() {
//    createQuestionValue(this.questionNumber);
    createQuestionValue();
  }



//  createQuestionValue(int number) {
  createQuestionValue() {
    List<String> questionAnswerSolution = mathQuestion.getQuestion(this.questionNumber);
    this.Quest = new QuestionValue(questionAnswerSolution);
    /*
    // Hole die Frage, Lösung, Antwort usw.
    this.questionAnswerSolution = mathQuestion.getQuestion(this.questionNumber);
    // Zerlege diese Infos in die Einzelteile
    this.questionType = questionAnswerSolution[0];
    // *1*
    this.questionBlock = questionAnswerSolution[1];
    // *2*
    this.question = questionAnswerSolution[2];
    // *4*
    if (this.solutionText.length > 1) {
      this.solutionText.clear();
    }
    this.solutionText.add('Hier steht die Antwort!');
    this.solutionText.add(this.questionAnswerSolution[4]);
    // *5*
    this.correctAnswer = this.questionAnswerSolution[5];

    // *6 - 9*
    if (this.solution.length > 1) {
      this.solution.clear();
    }
    for (var i = 6; i < 10; i++) {
      print('[Abfrage Widget] Forschleife, i = $i');
      print('[Abfrage Widget] solution = ' + this.questionAnswerSolution[i]);
      this.solution.add(this.questionAnswerSolution[i]);
    }
    */
  }

  //             _questions = [Rubrik, Thema, Aufgaben, Richtige Lösung, Erklärung, L1, L2, L3, L4
  //List<String> _questions = ['mathe', 'Einmaleins 5-er Reihe','10 x 5', '1', 'Ja, 10 x 5 = 50', '50', '20', '15', '12'];

  @override
  void initState() {
    print('[AbfrageManager State] initState');
    //_questions.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(QuestionManager oldWidget) {
    print('[AbfrageManager State] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('[AbfrageManager State] build() questionNumber = ' + this.questionNumber.toString());

//    createQuestionValue(this.questionNumber);
    createQuestionValue();

    Widget titleSection = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        /* Textzeile unter dem Bild */
        children: [
          Expanded(
            child: Text(
              // Fragentitel
              Quest.getQuestionTitle(),
              //this.questionBlock,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.green,
              ), //Anzahl der Richtigen Aufgaben
              Text(
                //'41 von 50',
                widget.playerCounter.toString(),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );

    // Frage Widget
    Widget questionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        Quest.getQuestionText(),
        //this.question,
        //'Berechen 6 x 8.',
        softWrap: true,
      ),
    );



    Column _buildButtonColumn(Color color, iconByNumber, String label) {
      //IconData icon = iconButtonMap[iconByNumber];
      IconData icon = QUESTGLOBAL.getIconButtonByNumber(iconByNumber);
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon, color: color),
              onPressed: widget.tryToSolveQuestion == true
                  ? null
                  : () { // () {
                print('_buildButtonColumn iconByNumber =  ' + iconByNumber.toString());
                print('_buildButtonColumn correctAnswer =  ' + Quest.getCorrectAnswer().toString());
                // Löseversuch!
                widget.tryToSolveQuestion = true;
                // es könnte die Falsche Lösung sein!
                //if (widget.tryToSolveQuestion == false) {
                  if (Quest.getCorrectAnswer() == iconByNumber.toString() ) {
                    setState(() {
                      this.showSolution = 1;
                      widget.solvedQuestion = true;
                      widget.raisedButtonColor = Colors.lightGreen;
                      widget.playerCounter++;
                    });
                  } else {
                    setState(() {
                      this.showSolution = 2;
                      widget.solvedQuestion = false;
                      widget.raisedButtonColor = Colors.red;
                      widget.playerCounter-=2;
                      //widget.tryToSolveQuestion=false;
                    });
                  }
                //}
                print('_buildButtonColumn this.showSolution =  ' + this.showSolution.toString());
                print('_buildButtonColumn widget.tryToSolveQuestion  =  ' + widget.tryToSolveQuestion .toString());
              }),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    // erzeuge die Buttonsection mit 4 Icon-Button á la Wer wird Millionär
    Widget answerSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, 1, Quest.getSolution(0)), //this.solution[0]),
          //'Lösung 1'),
          _buildButtonColumn(color, 2, Quest.getSolution(1)), //this.solution[1]),
          //'Lösung 2'),
          _buildButtonColumn(color, 3, Quest.getSolution(2)), //this.solution[2]),
          //'Lösung 3'),
          _buildButtonColumn(color, 4, Quest.getSolution(3)), //this.solution[3]), //'Lösung 4'),
        ],
      ),
    );


    Widget solutionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            // Lösungstext
            Quest.getSolutionText(showSolution),
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              background: Paint()..color = widget.raisedButtonColor),
            //this.solutionText[showSolution],
            softWrap: true,
          ),
          RaisedButton(
            color: widget.tryToSolveQuestion ? widget.raisedButtonColor: Colors.grey,
            //color: widget.tryToSolveQuestion ? raisedButtonColor : Colors.grey,
            child: Text('Weiter'),
            onPressed: () {
              if (widget.solvedQuestion == true) {
                setState(() {
                  print('solutionSection correctAnswer =  ' + Quest.getCorrectAnswer().toString());
                  this.questionNumber++;
                  widget.solvedQuestion = false;
                  widget.tryToSolveQuestion = false;
                  this.showSolution = 0;
                });
              } else {
                setState(() {
                  print('solutionSection Falseanswer =  ' + Quest.getCorrectAnswer().toString());
                  this.questionNumber++;
                  widget.solvedQuestion = false;
                  widget.tryToSolveQuestion = false;
                  this.showSolution = 0;
                  //widget.raisedButtonColor = Colors.red;
                });
              }
            }),
            /*
            onPressed: widget.solvedQuestion == false
                ? null
                : () {
                    if (widget.solvedQuestion) {
                      setState(() {
                        print('solutionSection correctAnswer =  ' + Quest.getCorrectAnswer().toString());
                        this.questionNumber++;
                        widget.solvedQuestion = false;
                        widget.tryToSolveQuestion = false;
                        this.showSolution = 0;
                      });
                    } else {
                      setState(() {
                        print('solutionSection Falseanswer =  ' + Quest.getCorrectAnswer().toString());
                        this.questionNumber++;
                        widget.solvedQuestion = false;
                        widget.tryToSolveQuestion = false;
                        this.showSolution = 0;
                        widget.raisedButtonColor = Colors.red;
                      });
                    }
                  },
           ),
           */
        ],
      ),
    );




    // return eine Spalte mit Bild, titleSection, questionSection
    return Column(
      children: [
        Image.asset(
          // Zeige ein Bild von der Kategorie
          //questionTypeMap[questionType],
          QUESTGLOBAL.getQuestionTypImageByName(Quest.getQuestionType()),
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,             // Textzeile unter dem Bild mit Rubrik und Aufgaben von...
        questionSection,          // Die Frage
        answerSection,            // Die Antworten
        solutionSection,          // Die Lösung
      ],
    );
    /*
    return Column(
      children: [
        ShowQuestion(this.questionAnswerSolution),
        answerSection,
        solutionSection,
      ],
    );
    */
  }
}
