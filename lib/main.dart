import 'package:dynamic_color/dynamic_color.dart';
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

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.purple);
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.purple, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return DynamicColorBuilder(builder: (lighColorScheme, darkColorScheme) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.lightPurple,
              colorScheme: lighColorScheme ?? defaultLightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme ?? defaultDarkColorScheme,
              scaffoldBackgroundColor: AppColors.primaryDarkGrey,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.homeRoute,
          );
        });
      },
    );
  }
}
