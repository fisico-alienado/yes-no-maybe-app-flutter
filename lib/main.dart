import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No Maybe App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yes No Maybe App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: (){ }, 
            child: const Text('Click me')
          ),
        ),
      ),
    );
  }
}