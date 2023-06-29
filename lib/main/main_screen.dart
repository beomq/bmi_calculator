import 'package:bmi_calculator/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = MainViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    viewModel.load();
  }

  @override
  void dispose() {
    viewModel.heightController.dispose();
    viewModel.weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: viewModel.heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키를 입력하세요';
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: viewModel.weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  if (viewModel.formKey.currentState?.validate() == false) {
                    return;
                  }

                  viewModel.save();
                  // context.push(
                  //     '/result/${_heightController.text}/${_weightController.text}');

                  context.push(Uri(path: '/result', queryParameters: {
                    'height': viewModel.heightController.text,
                    'weight': viewModel.weightController.text
                  }).toString());

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultScreen(
                  //       height: double.parse(_heightController.text),
                  //       weight: double.parse(_weightController.text),
                  //     ),
                  //   ),
                  // );
                },
                child: const Text('결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
