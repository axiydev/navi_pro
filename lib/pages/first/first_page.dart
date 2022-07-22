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
  String? _firstData;

  Future<void> _onChnageRoute() async {
    _firstData = await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const SecondPage(
                  data: '94895384',
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
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          onPressed: () async {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const SecondPage(
            //               data: "12345",
            //             )));

            await _onChnageRoute();
          },
          label: const Text("Second Page")),
    );
  }
}
