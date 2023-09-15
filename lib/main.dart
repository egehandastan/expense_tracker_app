import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 246, 251, 243));
var appBarScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 133, 187, 101));
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(16),
        ),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            ),
            ),
      
      ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: appBarScheme.onPrimaryContainer,
          foregroundColor: appBarScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(16),
        ),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(fontWeight: FontWeight.bold,
              color: kColorScheme.onBackground,
              fontSize:16 )
            ),
            ),
            // themeMode: ThemeMode.system,//default
    home: const Expenses(),
  ));
}
