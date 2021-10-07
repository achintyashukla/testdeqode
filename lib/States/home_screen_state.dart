import 'package:flutter/material.dart';
import 'package:testdeqode/Models/data_model.dart';
import 'package:testdeqode/http/http.dart';

class HomeScreenState extends ChangeNotifier {
  bool fetching = true;
  late DataModel data;

  HomeScreenState() {
    getData().then(
      (value) {
        data = value;
        fetching = false;
        notifyListeners();
      },
    );
  }
}
