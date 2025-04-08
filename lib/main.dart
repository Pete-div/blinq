import 'package:bliqtest/firebase_options.dart';
import 'package:bliqtest/ui/dashboard/dashboard_screen.dart';
import 'package:bliqtest/view_models/app_themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import '_lib.dart';

void main()async {

     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options:  DefaultFirebaseOptions.currentPlatform
    );
      runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

  final Map<ThemeMode, ThemeData> appThemes = {
    ThemeMode.light: ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      
      visualDensity: VisualDensity.adaptivePlatformDensity
     // textTheme: AppInfo.appTextTheme,
    ),
    ThemeMode.dark: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        //textTheme: AppInfo.appTextTheme,
              visualDensity: VisualDensity.adaptivePlatformDensity,

        scaffoldBackgroundColor: Colors.black)
  };


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,ch) {
        final themeModel = ref.watch(appThemeModeProvider);
            final appTheme = ref.watch(appThemeProvider);

        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
          statusBarBrightness:appTheme.isDark? Brightness.dark:Brightness.light,
          statusBarIconBrightness:appTheme.isDark? Brightness.dark:Brightness.light,
          statusBarColor:appTheme.isDark? Colors.white:Colors.black),
          child: MaterialApp(
            title: 'Blinqpay',
           theme: appThemes[ThemeMode.light],
                      darkTheme: appThemes[ThemeMode.dark],
                     themeMode: themeModel,
            home: const DashBoardScreen(),
          ),
        );
      }
    );
  }
}


