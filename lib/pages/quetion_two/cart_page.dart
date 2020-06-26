import 'package:app_provider/data_model.dart';
import 'package:app_provider/pages/quetion_two/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_provider/app_provider.dart';
import 'package:app_provider/pages/app_bar.dart';
import 'package:app_provider/pages/quetion_one/answer_one.dart';
import 'package:provider/provider.dart';

import 'show_all_product.dart';

class CartView extends StatelessWidget {
  final String title;
  CartView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whiteColor = Color.fromRGBO(185, 186, 211, 1);
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 24, 30, 1),
      // appBar: MyAppBar(),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            MyAppBar(
              title: 'Show All Products',
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: myProvider.getAllData().length,
                  itemBuilder: (BuildContext context, index) {
                    var data = myProvider.getAllData()[index];
                    // return Text('${data.title}');
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(data: data),
                          ),
                        );
                      },
                      child: DataCard(data: data, index: index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
