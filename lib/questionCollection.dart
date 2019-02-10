/*
App:
    einmaleins Trainer
file:
    questionList.dart

Copyright (c) 2019
ralf Weinert <downad@freenet.de>
Source Code:
https://github.com/downad/flutter_einmaleins
License: GPLv2.1

*/

import 'dart:math';

class QuestionCollection {
  List<String> qList = [];
  List questionList = [];

  QuestionCollection() {
    //                  [Rubrik, Thema, Aufgaben, Richtige Lösung, Erklärung, Korreckte Antwort, L1, L2, L3, L4
    //                  0         1       2           3               4           5               6   7   8   9
    //List<String> _questions = ['mathe', 'Einmaleins 5-er Reihe','10 x 5', '1', 'Ja, 10 x 5 = 50', '50', '20', '15', '12'];
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '10x3', '30', ' da 10x3 = 30', '4', '79', '4', '58', '30' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '10x4', '40', ' da 10x4 = 40', '2', '52', '40', '51', '31' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '10x5', '50', ' da 10x5 = 50', '3', '85', '44', '50', '3' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '10x6', '60', ' da 10x6 = 60', '3', '15', '94', '60', '92' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '10x7', '70', ' da 10x7 = 70', '2', '31', '70', '24', '31' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '10x8', '80', ' da 10x8 = 80', '4', '37', '5', '71', '80' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '10x9', '90', ' da 10x9 = 90', '2', '68', '90', '50', '40' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '2x2', '4', ' da 2x2 = 4', '4', '3', '29', '62', '4' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '2x3', '6', ' da 2x3 = 6', '3', '41', '41', '6', '72' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '2x4', '8', ' da 2x4 = 8', '2', '39', '8', '19', '97' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '2x5', '10', ' da 2x5 = 10', '1', '10', '23', '48', '19' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '2x6', '12', ' da 2x6 = 12', '2', '85', '12', '76', '45' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '2x7', '14', ' da 2x7 = 14', '3', '10', '20', '14', '25' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '2x8', '16', ' da 2x8 = 16', '2', '38', '16', '75', '38' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '2x9', '18', ' da 2x9 = 18', '1', '18', '54', '56', '76' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '3x2', '6', ' da 3x2 = 6', '1', '6', '36', '47', '17' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '3x3', '9', ' da 3x3 = 9', '3', '14', '70', '9', '61' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '3x4', '12', ' da 3x4 = 12', '4', '20', '35', '32', '12' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '3x5', '15', ' da 3x5 = 15', '2', '81', '15', '90', '76' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '3x6', '18', ' da 3x6 = 18', '3', '39', '93', '18', '98' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '3x7', '21', ' da 3x7 = 21', '3', '2', '48', '21', '80' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '3x8', '24', ' da 3x8 = 24', '4', '43', '87', '38', '24' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '3x9', '27', ' da 3x9 = 27', '2', '8', '27', '49', '21' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '4x2', '8', ' da 4x2 = 8', '3', '81', '88', '8', '1' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '4x3', '12', ' da 4x3 = 12', '4', '63', '68', '41', '12' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '4x4', '16', ' da 4x4 = 16', '2', '22', '16', '95', '77' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '4x5', '20', ' da 4x5 = 20', '2', '20', '20', '8', '37' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '4x6', '24', ' da 4x6 = 24', '4', '71', '100', '88', '24' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '4x7', '28', ' da 4x7 = 28', '2', '82', '28', '51', '93' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '4x8', '32', ' da 4x8 = 32', '3', '19', '12', '32', '46' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '4x9', '36', ' da 4x9 = 36', '4', '96', '18', '100', '36' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '5x2', '10', ' da 5x2 = 10', '4', '90', '95', '73', '10' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '5x3', '15', ' da 5x3 = 15', '2', '68', '15', '6', '14' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '5x4', '20', ' da 5x4 = 20', '4', '55', '15', '2', '20' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '5x5', '25', ' da 5x5 = 25', '4', '78', '70', '37', '25' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '5x6', '30', ' da 5x6 = 30', '1', '30', '89', '41', '15' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '5x7', '35', ' da 5x7 = 35', '1', '35', '70', '75', '89' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '5x8', '40', ' da 5x8 = 40', '2', '36', '40', '38', '44' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '5x9', '45', ' da 5x9 = 45', '2', '16', '45', '18', '93' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '6x2', '12', ' da 6x2 = 12', '1', '12', '32', '64', '74' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '6x3', '18', ' da 6x3 = 18', '3', '72', '40', '18', '86' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '6x4', '24', ' da 6x4 = 24', '2', '50', '24', '81', '37' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '6x5', '30', ' da 6x5 = 30', '1', '30', '38', '96', '51' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '6x6', '36', ' da 6x6 = 36', '1', '36', '34', '93', '64' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '6x7', '42', ' da 6x7 = 42', '3', '27', '30', '42', '17' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '6x8', '48', ' da 6x8 = 48', '3', '30', '53', '48', '90' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '6x9', '54', ' da 6x9 = 54', '1', '54', '23', '54', '92' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '7x2', '14', ' da 7x2 = 14', '3', '20', '46', '14', '92' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '7x3', '21', ' da 7x3 = 21', '1', '21', '32', '99', '87' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '7x4', '28', ' da 7x4 = 28', '4', '52', '86', '45', '28' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '7x5', '35', ' da 7x5 = 35', '2', '75', '35', '95', '87' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '7x6', '42', ' da 7x6 = 42', '1', '42', '42', '88', '73' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '7x7', '49', ' da 7x7 = 49', '3', '10', '86', '49', '50' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '7x9', '63', ' da 7x9 = 63', '1', '63', '44', '45', '35' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '8x2', '16', ' da 8x2 = 16', '4', '1', '67', '44', '16' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '8x3', '24', ' da 8x3 = 24', '2', '67', '24', '52', '46' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '8x4', '32', ' da 8x4 = 32', '2', '48', '32', '61', '99' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '8x5', '40', ' da 8x5 = 40', '4', '7', '65', '54', '40' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '8x6', '48', ' da 8x6 = 48', '2', '12', '48', '90', '63' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '8x7', '56', ' da 8x7 = 56', '1', '56', '4', '89', '65' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '8x8', '64', ' da 8x8 = 64', '2', '81', '64', '51', '92' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '8x9', '72', ' da 8x9 = 72', '1', '72', '44', '45', '57' ]);
    questionList.add(['mathe', 'Einmaleins 2-er Reihe', '9x2', '18', ' da 9x2 = 18', '2', '45', '18', '49', '76' ]);
    questionList.add(['mathe', 'Einmaleins 3-er Reihe', '9x3', '27', ' da 9x3 = 27', '1', '27', '53', '8', '54' ]);
    questionList.add(['mathe', 'Einmaleins 4-er Reihe', '9x4', '36', ' da 9x4 = 36', '3', '48', '28', '36', '47' ]);
    questionList.add(['mathe', 'Einmaleins 5-er Reihe', '9x5', '45', ' da 9x5 = 45', '1', '45', '80', '31', '81' ]);
    questionList.add(['mathe', 'Einmaleins 6-er Reihe', '9x6', '54', ' da 9x6 = 54', '4', '83', '80', '37', '54' ]);
    questionList.add(['mathe', 'Einmaleins 7-er Reihe', '9x7', '63', ' da 9x7 = 63', '1', '63', '27', '52', '89' ]);
    questionList.add(['mathe', 'Einmaleins 8-er Reihe', '9x8', '72', ' da 9x8 = 72', '1', '72', '56', '42', '96' ]);
    questionList.add(['mathe', 'Einmaleins 9-er Reihe', '9x9', '81', ' da 9x9 = 81', '2', '67', '81', '65', '9' ]);
  }

  getQuestion(int number) {
    return questionList[number];
  }

  getRandomQuestionList(int bereich) {
    List<int> returnIntListe =[];
    int zufallsZahl;
    bool newListItem = false;
    int maxBereich = questionList.length;
    //return [1,2,3,4];

    Random zufall = new Random(); // neues Random Objekt, namens zufall
    for (int i = 0; i < bereich; i++) {
      newListItem = false;
      while (newListItem == false) {
        zufallsZahl = zufall.nextInt(maxBereich); //Ganzahlige Zufallszahl zwischen 0 und questionList.length
        print('[Question] getRandomQuestionList i: ' + i.toString());
        print('[Question] getRandomQuestionList zufallszahl: ' + zufallsZahl.toString());
        newListItem = true;
        if (returnIntListe.contains(zufallsZahl) == true) {
          newListItem = false;
        }
      }
      returnIntListe.add(zufallsZahl);
    }
  return returnIntListe;

  }
}





