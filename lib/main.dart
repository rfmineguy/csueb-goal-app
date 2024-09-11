import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/home_page.dart';
import 'src/logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = Logger(printer: SimpleLogPrinter());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
