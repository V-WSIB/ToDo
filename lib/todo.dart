import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Checklist extends StatelessWidget {
  final List<String> tasks, complete;
  final VoidCallback update, updateTwo;
  final bool isDone;
  const Checklist(this.tasks, this.complete,
    this.update, this.updateTwo, this.isDone,
    {Key? key}) : super(key: key);

  Widget _displayNotDone(String task) {
    return ListTile(
      title: Text(
        task,
        style: const TextStyle(fontSize: 20),
      ),
      leading: const Icon(Icons.check_box_outline_blank),
      onTap: () {
        tasks.remove(task);
        complete.add(task);
        update();
      },
    );
  }

  Widget _displayDone(String task) {
    return ListTile(
      title: Text(
        task,
        style: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.lineThrough
        ),
      ),
      leading: const Icon(Icons.check_box),
      onTap: () {
        complete.remove(task);
        tasks.add(task);
        update();
        updateTwo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int listLength;
    List<String> listElements;
    Function display;
    isDone ? {
      listLength = complete.length,
      listElements = complete,
      display = _displayDone,
    } : {
      listLength = tasks.length,
      listElements = tasks,
      display = _displayNotDone,
    };
    return ListView.builder(
      itemCount: listLength,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: display(listElements[index]),
        );
      },
    );
  }
}