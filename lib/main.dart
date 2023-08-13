import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:window_size/window_size.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:files_management_system/provider.dart';

void main() {

  ///Set minimum window size, and window title
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowTitle('Files Management System');
    setWindowMinSize(const Size(640, 480));
    setWindowMaxSize(Size.infinite);
  }

  ///Initialize FFi loader for database and create the database
  ///name as default database path\FilesManagementSystem.db
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  ///Run App
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920,1080),
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
             Locale('ar'),
          ],
          theme: ThemeData(
            primarySwatch: getMaterialColor(const Color(0xFF377AB0)),
          ),
          home: child,
        );
      },
      child: Provider(),
    );
  }


  /// [getMaterialColor] converts [Color] object to [MaterialColor]
  /// The primary use in FMS is for change the date picker default theme color.
  MaterialColor getMaterialColor(Color color) {
    List strengths = <double> [0.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1, len = 9; i <= len; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    }

    return MaterialColor(color.value, swatch);
  }
}

