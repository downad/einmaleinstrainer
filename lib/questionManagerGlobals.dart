/*
App:
    einmaleins Trainer
file:
    questionManagerGlobals.dart

Copyright (c) 2019
ralf Weinert <downad@freenet.de>
Source Code:
https://github.com/downad/flutter_einmaleins
License: GPLv2.1

*/

import 'package:flutter/material.dart';

class QuestionManagerGlobals {
  // Icons für die Buttons
  final Map iconButtonMap = {
    1: Icons.looks_one,
    2: Icons.looks_two,
    3: Icons.looks_3,
    4: Icons.looks_4,
  };
  final Map questionTypeMap = {
    'default': 'assets/food.jpg',
    'mathe': 'assets/mathe.jpg'
  };

  QuestionManagerGlobals(){
    print ("Load: QuestionGobals - erledigt");
  }

  getQuestionTypImageByName(String questionType) {
    // Check Value
    if (questionTypeMap.containsKey(questionType)) {
      return this.questionTypeMap[questionType];
    } else {
      print ("Error: QuestionGobals - questionType gibt es nicht, übermittle default!");
      return this.questionTypeMap['default'];
    }
  }

  getIconButtonByNumber(int number) {
    // Check Value
    if (iconButtonMap.containsKey(number)) {
      return this.iconButtonMap[number];
    } else {
      print ("Error: QuestionGobals - numberString gibt es nicht!");
    }
  }

}