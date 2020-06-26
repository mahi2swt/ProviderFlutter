import 'package:app_provider/data_model.dart';
import 'package:app_provider/pages/quetion_two/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_provider/app_provider.dart';
import 'package:app_provider/pages/app_bar.dart';
import 'package:app_provider/pages/quetion_one/answer_one.dart';
import 'package:provider/provider.dart';

class ShowAllProduct extends StatelessWidget {
  final String title;
  ShowAllProduct({Key key, this.title}) : super(key: key);

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
                  itemCount: myProvider.getProductData().length,
                  itemBuilder: (BuildContext context, index) {
                    var data = myProvider.getProductData()[index];
                    // return Text('${data.title}');
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(data: data, index: index),
                          ),
                        );
                      },
                      child: DataCard(
                        data: data,
                        index: index,
                      ),
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

class DataCard extends StatelessWidget {
  final DataModel data;
  final int index;
  // final Function onPressed;
  DataCard({this.data, this.index});

  @override
  Widget build(BuildContext context) {
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Color.fromRGBO(35, 40, 48, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                bottomLeft: const Radius.circular(20),
              ),
              child: Image.asset(
                '${data.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${data.title}',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                  ),
                ),
                Container(
                  child: Text(
                    '${data.description}',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${data.price}',
                      style: TextStyle(
                        fontSize: 20,
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (data.isAdded)
                          myProvider.removeData(index);
                        else
                          myProvider.addData(data: data, index: index);
                      },
                      child: Text(
                        (data.isAdded) ? 'Remove' : 'Add to Cart',
                        style: TextStyle(
                          fontSize: 15,
                          color: (data.isAdded)
                              ? CupertinoColors.systemRed
                              : CupertinoColors.activeGreen,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
