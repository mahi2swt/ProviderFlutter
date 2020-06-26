import 'dart:async';

import 'package:app_provider/data_model.dart';
import 'package:app_provider/pages/image_data_model.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  increment() {
    counter = counter + 1;
  }

  decrement() {
    counter = counter - 1;
  }

  // Answer 1
  String _inputValue = '';
  String get inputValue => _inputValue;

  showText(value) {
    _inputValue = value;
    notifyListeners();
  }

  // Answer 1
  String _inputValueType2 = '';
  String get inputValueType2 => _inputValueType2;

  showTextType2(value) {
    _inputValueType2 = value;
    notifyListeners();
  }

  List<DataModel> cardData = productList;
  getProductData() => cardData;

  List<DataModel> selectedData = List();
  getAllData() => selectedData;
  void addData({DataModel data, index}) {
    cardData[index].isAdded = true;
    selectedData.add(data);
    notifyListeners();
  }

  void removeData(int index) {
    cardData[index].isAdded = false;
    selectedData.removeAt(index);
    notifyListeners();
  }

  List<ImageDataModel> myImageData = imageData;

  Stream<List<ImageDataModel>> get myStreamListNow async* {
    for (var i = 0; i < myImageData.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield myImageData.sublist(0, i + 1);
    }
    // notifyListeners();
  }
}
