import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../image_data_model.dart';

class AnswerThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider myProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 24, 30, 1),
      appBar: AppBar(
        title: Text('Answer Three'),
        backgroundColor: Color.fromRGBO(35, 40, 48, 1),
      ),
      body: Container(
        child: StreamBuilder<List<ImageDataModel>>(
          stream: myProvider.myStreamListNow,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  var data = snapshot.data[index];
                  return Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(35, 40, 48, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(35, 40, 48, 1),
                          backgroundImage: AssetImage(data.image),
                          radius: 30,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            data.title,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

// class AnswerThree extends StatefulWidget {
//   final String title;
//   AnswerThree({Key key, this.title}) : super(key: key);

//   @override
//   _AnswerThreeState createState() => _AnswerThreeState();
// }

// class _AnswerThreeState extends State<AnswerThree> {
//   @override
//   Widget build(BuildContext context) {
//     AppProvider myProvider = Provider.of<AppProvider>(context);
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(20, 24, 30, 1),
//       appBar: AppBar(
//         title: Text('Answer Three'),
//         backgroundColor: Color.fromRGBO(35, 40, 48, 1),
//       ),
//       body: Container(
//         child: StreamBuilder<List<ImageDataModel>>(
//           stream: myProvider.myStreamListNow,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState != ConnectionState.waiting) {
//               return ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, index) {
//                   var data = snapshot.data[index];
//                   return Container(
//                     padding: EdgeInsets.all(15),
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(35, 40, 48, 1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         CircleAvatar(
//                           backgroundColor: Color.fromRGBO(35, 40, 48, 1),
//                           backgroundImage: AssetImage(data.image),
//                           radius: 30,
//                         ),
//                         SizedBox(width: 20),
//                         Expanded(
//                           child: Text(
//                             data.title,
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
