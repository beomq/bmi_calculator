import 'package:flutter/material.dart';

class ResultViewModel {
  final double height;
  final double weight;

  ResultViewModel({required this.height, required this.weight});

  double getBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String getBmiResult() {
    double bmi = getBmi();
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Icon getBmiIcon() {
    double bmi = getBmi();
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.green,
      size: 100,
    );
    if (bmi >= 23) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.yellow,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.red,
        size: 100,
      );
    }
    return icon;
  }
}
