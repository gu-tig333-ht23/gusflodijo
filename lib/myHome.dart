import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';
import 'addview.dart';
import 'listviewbuilder.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        actions: [
          DropdownButton<String>(
              value: context.read<MyState>().filter,
              onChanged: (newValue) {
                setState(() {
                  context.read<MyState>().filter = newValue!;
                  context.read<MyState>().notifyListeners();
                });
              },
              items: ['All', 'Done', 'Not Done'].map((filter) {
                return DropdownMenuItem<String>(
                  value: (filter),
                  child: Text(filter),
                );
              }).toList()),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const ListViewBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
