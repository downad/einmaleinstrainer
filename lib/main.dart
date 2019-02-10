/*
App:
    einmaleins Trainer
file:
    main.dart

Copyright (c) 2019
ralf Weinert <downad@freenet.de>
Source Code:
https://github.com/downad/flutter_einmaleins
License: GPLv2.1

*/

import 'package:flutter/material.dart';

import './questionManager.dart';

/*
 Das Main für die 1 mal 1 App
  # Version
  0.1	initial - Februar 2019
  0.2 	Fragen werden angezeigt und über 4 Button kann man die richtige Antwort wählen
  0.3	Punkteliste wird geführt, Feedback zu den Antworten mit grün (richtig) und rot (falsch)

 */

void main() {
  runApp(EinMalEins());
}


class EinMalEins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Einmalein Quiz'),
        ),
        body: QuestionManager('Mathe'),
      ),
    );
  }
}