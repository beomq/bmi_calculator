import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainViewModel {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  get heightController => _heightController;
  get weightController => _weightController;
  get formKey => _formKey;

  Future<void> save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');
    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
    }
  }
}
