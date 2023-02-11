import 'package:darkmodetheme/theme_manager.dart';
import 'package:darkmodetheme/thememodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Theme_Manager _theme_manager = Theme_Manager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _theme_manager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _theme_manager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        actions: [
          Switch(
              value: _theme_manager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _theme_manager.toggleTheme(newValue);
              })
        ],
      )),
      theme: lightTheme,
      darkTheme: DarkTheme,
      themeMode: _theme_manager.themeMode,
    );
  }
}
