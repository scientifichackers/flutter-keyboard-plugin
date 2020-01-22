import 'package:flutter/material.dart';
import 'package:keyboard/keyboard.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final events = <String>["(Start pressing keys to see events)"],
      controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Keyboard.init();
    Keyboard.onKeyDown.add((code, event) {
      if (!mounted) return;
      setState(() {
        events.add("OnKeyDown: $code\n$event");
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        controller.jumpTo(controller.position.maxScrollExtent);
      });
    });
  }

  @override
  void dispose() {
    Keyboard.onKeyDown.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Plugin'),
        ),
        body: ListView(
          shrinkWrap: true,
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
