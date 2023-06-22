import 'package:bmi_calculator/main/main_screen.dart';
import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/result/:height/:weight',
      builder: (context, state) {
        final height =
            double.tryParse(state.pathParameters['height'] ?? '0') ?? 0;
        final weight =
            double.tryParse(state.pathParameters['weight'] ?? '0') ?? 0;
        return ResultScreen(height: height, weight: weight);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: false,
      ),
      routerConfig: _router,
    );
  }
}
