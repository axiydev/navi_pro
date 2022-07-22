import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String? data;
  static const String routeName = '/second';
  const SecondPage({this.data, super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
          child: Text(
            widget.data ?? "Second Page",
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
                heroTag: 'first',
                elevation: 0.0,
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop(widget.data);
                  }
                },
                label: const Text("First Page")),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton.extended(
                heroTag: '4',
                elevation: 0.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/last', arguments: {"id": 998});
                },
                label: const Text("Last Page")),
          ],
        ));
  }
}
