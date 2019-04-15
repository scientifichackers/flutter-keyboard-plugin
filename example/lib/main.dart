import 'package:flutter/material.dart';
import 'package:keyboard/keyboard.dart';
import 'package:flutter/scheduler.dart';

void main() {
  Keyboard.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final events = <String>[], controller = ScrollController();

  @override
  void initState() {
    super.initState();

    Keyboard.onKeyDown = (code, event) {
      if (!mounted) return;
      setState(() {
        events.add("$code\n$event");
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        controller.jumpTo(controller.position.maxScrollExtent);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Plugin'),
        ),
        body: ListView(
          controller: controller,
          children: events.map((it) {
            return ListTile(
              title: Card(
                child: Text(
                  it,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
