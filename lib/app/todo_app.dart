import 'package:todo_app/common/export/export.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.purple);
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.purple, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<UserModel> users = ref.watch(userProvider);
    String initialRoute =
        users.isEmpty ? Routes.onBoardingRoute : Routes.homeRoute;
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return DynamicColorBuilder(
          builder: (lighColorScheme, darkColorScheme) {
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
              initialRoute: initialRoute,
            );
          },
        );
      },
    );
  }
}
