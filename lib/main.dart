import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/onboarding/pages/onboarding_page.dart';
import 'package:todo_app/features/todo/pages/home_page.dart';

void main() => runApp(
      const ProviderScope(
        child: TodoApp(),
      ),
    );

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const OnBoardingPage(),
        );
      },
    );
  }
}
