import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_tracker.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // for Native Splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Will Display Logo till 3 second whenever i open Expense Tracker
  await Future.delayed(
    const Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const ExpenseTracker(),
    ),
  );
}
