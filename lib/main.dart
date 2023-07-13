import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/utils/manager/colors.dart';

import 'common/routes/router.dart';

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
            scaffoldBackgroundColor: AppColors.primaryDarkGrey,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeRoute,
        );
      },
    );
  }
}
