import 'package:flutter/material.dart';

import './questionManager.dart';

class AppMainWidget extends StatefulWidget {

  AppMainWidget() {
    print('[ProductManager Widget] Constructor');
  }
  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState');
    return _AppMainWidget();
  }
}

class _AppMainWidget extends State<AppMainWidget> {

  @override
  void initState() {
    print('[_AppMainWidget State] initState');
    super.initState();
  }

  @override
  void didUpdateWidget(AppMainWidget oldWidget) {
    print('[_AppMainWidget State] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('[_AppMainWidget State] build()');
    return Column(children: [Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
           QuestionManager('Mathe','random',3);
            //_products.add('Advanced Foodtester');
          });
        },
        child: Text('Starte EinMalEins-Trainer'),
      ),
    ),
    //Products(_products)
    //  QuestionManager('Mathe','random',3)
    ],);
  }
}