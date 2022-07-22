import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navi_pro/pages/second/second_page.dart';

class FirstPage extends StatefulWidget {
  static const String routeName = "/first";
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Map<String, dynamic>? _firstData;

  void _onChnageRoute() async {
    ///malumotni olish
    _firstData = await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const SecondPage(
                  data: '94895384',
                  id: 789,
                )));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Text(
          "First Page  $_firstData",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const SecondPage(
            //               data: "12345",
            //             )));

            _onChnageRoute();
          },
          label: const Text("Second Page")),
    );
  }
}
