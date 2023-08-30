
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//TodoListApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<String> _tasks = [];
  String strInput = '';

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    print(task);
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    print('removeTask');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Task'),
                content: TextField(
                  // onChanged: (value) => _addTask(value), //remove
                  onChanged: (value) => strInput = value,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Call _addTask function with the TextField value
                      _addTask(strInput);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        // child: Icon(Icons.add),
        child: Icon(Icons.add_box_outlined),
      ),
    );
  }
}



