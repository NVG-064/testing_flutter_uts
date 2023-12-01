import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Aplikasi Penggajian",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Home(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{});
  }
}
