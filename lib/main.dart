import 'package:flutter/material.dart';
import 'package:navi_pro/pages/first/first_page.dart';
import 'package:navi_pro/pages/last/last_page.dart';
import 'package:navi_pro/pages/second/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      routes: {
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(
              data: '0',
            ),
        '/last': (context) => const LastPage()
      },
      initialRoute: '/first',
    );
  }
}
