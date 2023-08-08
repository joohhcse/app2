
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewExample(),
      // GridViewExample()
      // ListViewExample()
      // StackExample()

    );
  }
}

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Example'),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2.0,
            child: Center(
              child: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}

class ListViewExample extends StatelessWidget {
  final List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', 'Fig'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (index.isEven) {
            return ListTile(
              title: Text(items[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
            );
          } else {
            return Container(
              color: Colors.grey[300],
              child: ListTile(
                title: Text(items[index]),
                leading: Icon(Icons.favorite),
              ),
            );
          }
        },
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Example'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Text(
                'Positioned',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}