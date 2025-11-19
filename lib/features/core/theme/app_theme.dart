import 'package:flutter/material.dart';

enum AppThemeType {
  lightBlue,
  darkBlue,
  lightGreen,
  darkGreen,
  lightOrange,
  darkOrange,
  lightPink,
  darkPink,
}

class AppTheme {
  static final Map<AppThemeType, ThemeData> _themes = {
    AppThemeType.lightBlue: _buildLightBlueTheme(),
    AppThemeType.darkBlue: _buildDarkBlueTheme(),
    AppThemeType.lightGreen: _buildLightGreenTheme(),
    AppThemeType.darkGreen: _buildDarkGreenTheme(),
    AppThemeType.lightOrange: _buildLightOrangeTheme(),
    AppThemeType.darkOrange: _buildDarkOrangeTheme(),
    AppThemeType.lightPink: _buildLightPinkTheme(),
    AppThemeType.darkPink: _buildDarkPinkTheme(),
  };

  static ThemeData getTheme(AppThemeType type) {
    return _themes[type] ?? _themes[AppThemeType.lightBlue]!;
  }

  static ThemeData _buildLightBlueTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildDarkBlueTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildLightGreenTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildDarkGreenTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildLightOrangeTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildDarkOrangeTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildLightPinkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _buildDarkPinkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static String getThemeName(AppThemeType type) {
    switch (type) {
      case AppThemeType.lightBlue:
        return 'Light Blue';
      case AppThemeType.darkBlue:
        return 'Dark Blue';
      case AppThemeType.lightGreen:
        return 'Light Green';
      case AppThemeType.darkGreen:
        return 'Dark Green';
      case AppThemeType.lightOrange:
        return 'Light Orange';
      case AppThemeType.darkOrange:
        return 'Dark Orange';
      case AppThemeType.lightPink:
        return 'Light Pink';
      case AppThemeType.darkPink:
        return 'Dark Pink';
    }
  }
}