import 'package:flutter/material.dart';
import 'todo.dart';

class Done extends StatefulWidget {
  final List<String> tasks, complete;
  final VoidCallback updateMain;
  const Done(this.tasks, this.complete, this.updateMain);
  @override
  State<Done> createState() => _Done(tasks, complete, updateMain);
}

class _Done extends State<Done> {
  final List<String> tasks, complete;
  final VoidCallback updateMain;
  _Done(this.tasks, this.complete, this.updateMain);

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete'),
      ),
      body: Checklist(tasks, complete, update, updateMain, true),
    );
  }
}