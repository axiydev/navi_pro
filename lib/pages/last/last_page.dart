import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  static const String routeName = '/last';
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  int? _data;

  @override
  void didChangeDependencies() {
    Map<String, dynamic>? map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (map != null && map.containsKey("id")) {
      _data = map['id'];
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Last Page"),
      ),
      body: Center(
        child: Text(
          "Last Page $_data",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          onPressed: () {
            Navigator.of(context).pushNamed('/first');
          },
          label: const Text("First Page")),
    );
  }
}
