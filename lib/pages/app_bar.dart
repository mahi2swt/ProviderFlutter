import 'package:app_provider/pages/quetion_two/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  MyAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return AppBar(
      title: Text(title),
      backgroundColor: Color.fromRGBO(35, 40, 48, 1),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartView(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.add_shopping_cart),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent[400],
                  ),
                  child: Text(
                    (myProvider.getAllData() == null)
                        ? '0'
                        : myProvider.getAllData().length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
