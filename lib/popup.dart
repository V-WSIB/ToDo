import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Popup extends StatelessWidget {
  final Function addTask;
  final TextEditingController _inputController = TextEditingController();
  Popup(this.addTask, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[20],
      scrollable: true,
      title: const Text(
        'New Task',
        style: TextStyle(fontWeight: FontWeight.bold)
      ),
      content: (
        TextFormField(
          controller: _inputController,
          decoration: const InputDecoration(
            hintText: 'What\'s on your mind?',
            icon: Icon(Icons.short_text),
          ),
        )
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, 'Cancel'),
        ),
        TextButton(
          child: const Text(
            'Add',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          onPressed: () {
            addTask(_inputController.text);
            Navigator.pop(context, 'Added');
          },
        ),
      ],
      elevation: 30,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );
  }
}