// Main Files
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// Project Files
import 'package:expense_tracker/widgets/expense_tracker.dart';

void main() async {
  // for Native Splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Will Display Logo till 3 second whenever i open Expense Tracker
  await Future.delayed(
    const Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();
  // for Device orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        cardTheme: CardTheme(
          margin: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ExpenseTracker(),
    ),
  );
}
