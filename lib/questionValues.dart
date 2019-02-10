/*
App:
    einmaleins Trainer
file:
    questionValues.dart

Copyright (c) 2019
ralf Weinert <downad@freenet.de>
Source Code:
https://github.com/downad/flutter_einmaleins
License: GPLv2.1

*/

class QuestionValues {
  // bekommt als Übergabe die Liste mit den Quest-Daten
  //                  [Rubrik, Thema, Aufgaben, Richtige Lösung, Erklärung, Korreckte Antwort, L1, L2, L3, L4
  //                  0         1       2           3               4           5               6   7   8   9
  // und zerlegt diese in Einzelteile

  String questionType;  // *1* = 'mathe'
  String questionTitle; // *2* = 'Einmaleins 5- Reihe'
  String questionText;   // *3* = '10 * 5', die Aufgabe
  List<String> solutionText = []; //*4*
  String correctAnswer; // *5* = '1', die richtige Lösung
  int showSolution = 0;
  List<String> solution = [];

  QuestionValues(List<String>  questionAnswerSolution) {
    // check Länge der Liste = 9
    if (questionAnswerSolution.length != 10) {
      print ("Error: QuestionValue - questionAnswerSolution.length<>9) !");
    }
    // Zerlege diese Infos in die Einzelteile
    this.questionType = questionAnswerSolution[0];
    // *1*
    this.questionTitle = questionAnswerSolution[1];
    // *2*
    this.questionText = questionAnswerSolution[2];
    // *4*
    this.solutionText.add('');
    this.solutionText.add('Ja,' +questionAnswerSolution[4]);
    this.solutionText.add('Falsch,' +questionAnswerSolution[4]);
    // *5*
    this.correctAnswer = questionAnswerSolution[5];

    // *6 - 9*
    for (var i = 6; i < 10; i++) {
      print('[Abfrage Widget] Forschleife, i = $i');
      print('[Abfrage Widget] solution = ' + questionAnswerSolution[i]);
      this.solution.add(questionAnswerSolution[i]);
    }
  }

  getQuestionType(){
    return this.questionType;
  }
  getQuestionTitle(){
    return this.questionTitle;
  }
  getQuestionText(){
    return this.questionText;
  }
  getSolutionText(int number){
    if (number <0 && number >1) {
      print ("Error: QuestionValue - getSolutionText(int number): number ungleich 0,1!");
    }
    return this.solutionText[number];
  }
  getCorrectAnswer(){
    return this.correctAnswer;
  }
  getSolution(int number){
    if (number <0 && number >3) {
      print ("Error: QuestionValue - getSolution(int number): number ungleich 0,1,2,3!");
    }
    return this.solution[number];
  }
}