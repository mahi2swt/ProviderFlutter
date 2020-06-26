import 'package:app_provider/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_provider.dart';

class AnswerOne extends StatelessWidget {
  String inputData;
  @override
  Widget build(BuildContext context) {
    Color whiteColor = Color.fromRGBO(185, 186, 211, 1);
    final AppProvider myProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 24, 30, 1),
      appBar: AppBar(
        title: Text('Solution 1'),
        backgroundColor: Color.fromRGBO(35, 40, 48, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                myProvider.inputValue,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white10,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(20, 2, 20, 6),
                    hintText: 'reply here...',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                      fontSize: 20,
                    ),
                  ),
                  onChanged: (text) {
                    inputData = text;
                  },
                ),
              ),
              SizedBox(height: 20),
              SecondButton(
                text: 'SHOW',
                onPresed: () {
                  myProvider.showText(inputData);
                  print('$inputData');
                },
              ),
              SizedBox(height: 35),
              Divider(color: Colors.white24, height: 1),
              SizedBox(height: 35),
              Text(
                myProvider.inputValueType2,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white10,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(20, 2, 20, 6),
                    hintText: 'reply here...',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                      fontSize: 20,
                    ),
                  ),
                  onChanged: (text) {
                    // inputData = text;
                    myProvider.showTextType2(text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
