import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mystate.dart';
import 'todoitem.dart';

class AddView extends StatelessWidget {
  String task = '';
  bool done = false;

  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to list:'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) async {
                    task = textEditingController.text;
                    context.read<MyState>().addTodos((TodoItem(task, false)));
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Todo',
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    hintStyle: const TextStyle(fontSize: 17),
                    suffixIcon: const Icon(Icons.add),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
