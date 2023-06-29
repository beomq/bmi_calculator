import 'package:bmi_calculator/main/main_screen.dart';
import 'package:bmi_calculator/result/result_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/result',
      // path: '/result/:height/:weight',
      builder: (context, state) {
        final height = double.parse(state.queryParameters['height']!);
        final weight = double.parse(state.queryParameters['weight']!);
        // final height = double.parse(state.pathParameters['height']!);
        // final weight = double.parse(state.pathParameters['weight']!);
        return ResultScreen(height: height, weight: weight);
      },
    ),
  ],
);
