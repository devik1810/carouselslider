import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List sliderImageList = [
    "asstes/images/1.jpg",
    "asstes/images/2.jpg",
    "asstes/images/3.jpg",
    "asstes/images/4.jpg",
    "asstes/images/5.jpg",
    "asstes/images/6.jpg",
    "asstes/images/7.jpg",
  ];

  int currentImageIndex = 0;

  void chnageIndex(int index) {
    currentImageIndex = index;
    notifyListeners();
  }
}
