import 'package:app_provider/app_provider.dart';
import 'package:app_provider/pages/quetion_one/answer_one.dart';
import 'package:app_provider/pages/quetion_three/answer_three.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quetion_two/show_all_product.dart';

class CounterPage extends StatelessWidget {
  final String title;
  CounterPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whiteColor = Color.fromRGBO(185, 186, 211, 1);
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 24, 30, 1),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(35, 40, 48, 1),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyButton(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  color: Colors.red,
                  onPresed: () => myProvider.decrement(),
                ),
                Container(
                  child: Text(
                    myProvider.counter.toString(),
                    style: TextStyle(color: whiteColor, fontSize: 50),
                  ),
                ),
                MyButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                  onPresed: () => myProvider.increment(),
                )
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SecondButton(
                    text: 'Quetion 1',
                    onPresed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerOne(),
                        ),
                      );
                    },
                  ),
                  SecondButton(
                    text: 'Quetion 2',
                    onPresed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowAllProduct(),
                        ),
                      );
                    },
                  ),
                  SecondButton(
                    text: 'Quetion 3',
                    onPresed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerThree(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Function onPresed;
  MyButton({Key key, this.icon, this.color, this.onPresed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: color,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: color.withOpacity(0.5),
              blurRadius: 20,
              //spreadRadius: 0.0,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}

class SecondButton extends StatelessWidget {
  final String text;
  final Function onPresed;
  SecondButton({Key key, this.text, this.onPresed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(35, 40, 48, 1),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black.withOpacity(1),
              blurRadius: 10,
              //spreadRadius: 0.0,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
