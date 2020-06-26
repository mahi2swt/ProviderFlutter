import 'package:app_provider/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_provider/app_provider.dart';
import 'package:app_provider/pages/app_bar.dart';
import 'package:app_provider/pages/quetion_one/answer_one.dart';
import 'package:provider/provider.dart';

import '../counter_page.dart';

class ProductDetails extends StatelessWidget {
  final DataModel data;
  final int index;
  ProductDetails({Key key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whiteColor = Color.fromRGBO(185, 186, 211, 1);
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 24, 30, 1),
      // appBar: MyAppBar(),
      body: Container(
        //
        child: Column(
          children: <Widget>[
            MyAppBar(
              title: '${data.title}',
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    '${data.title}',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 30,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        '${data.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      '${data.description}',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '\$${data.price}',
                    style: TextStyle(
                      fontSize: 40,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  SizedBox(height: 20),
                  SecondButton(
                    text: (data.isAdded) ? 'Remove from Cart' : 'Add to Cart',
                    onPresed: () {
                      if (data.isAdded)
                        myProvider.removeData(index);
                      else
                        myProvider.addData(data: data, index: index);
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
