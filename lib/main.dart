import 'package:flutter/material.dart';
import 'popup.dart';
import 'todo.dart';
import 'done.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // root widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Incomplete'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tasks = <String>[];
  final _complete = <String>[];

  void _addTask(String task) {
    _tasks.add(task);
    update();
  }

  void update() {
    setState(() {});
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return Popup(_addTask);
      },
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Checklist(_tasks, _complete, update, update, false),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Incomplete'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Complete'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => Done(_tasks, _complete, update)),
                );
              },
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPopup,
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
