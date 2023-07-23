import 'package:files_management_system/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowTitle('Files Management System');
    setWindowMinSize(const Size(640, 480));
    setWindowMaxSize(Size.infinite);
  }
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;// create database name as default database path\FilesManagementSystem.db

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor getMaterialColor(Color color) {
    List strengths = <double> [0.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1, len = 9; i <= len; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    });

    return MaterialColor(color.value, swatch);
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920,1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const[
            //const Locale('en', 'USA'),
            const Locale('ar'),
          ],
          theme: ThemeData(
            primarySwatch: getMaterialColor(Color(0xFF377AB0)),
          ),
          home: child,
        );
      },
      child: profider(),
    );
  }
}

