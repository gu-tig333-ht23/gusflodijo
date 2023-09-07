import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class Todo {
  final String item;
  final String desc;

  Todo(this.item, this.desc);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> todolist = [
      Todo('Handla', 'Morötter, mjölk och paprika'),
      Todo('Handla2', 'Morötter, mjölk och paprika'),
      Todo('Handla3', 'Morötter, mjölk och paprika'),
      Todo('Handla4', 'Morötter, mjölk och paprika'),
      Todo('Handla5', 'Morötter, mjölk och paprika'),
      Todo('Handla6', 'Morötter, mjölk och paprika'),
      Todo('Handla7', 'Morötter, mjölk och paprika'),
      Todo('Handla8', 'Morötter, mjölk och paprika'),
      Todo('Handla9', 'Morötter, mjölk och paprika'),
      Todo('Handla10', 'Morötter, mjölk och paprika'),
      Todo('Handla11', 'Morötter, mjölk och paprika'),
      Todo('Handla12', 'Morötter, mjölk och paprika'),
      Todo('Handla', 'Morötter, mjölk och paprika'),
      Todo('Handla', 'Morötter, mjölk och paprika'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'done',
                child: Text('Done'),
              ),
              const PopupMenuItem<String>(
                value: 'notDone',
                child: Text('Not Done'),
              ),
              const PopupMenuItem<String>(
                value: 'all',
                child: Text('All'),
              ),
            ],
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddView()));
          },
          child: const Icon(Icons.add, color: Colors.black87,size: 38, ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return TodoList(todolist[index]);
              },
              itemCount: todolist.length,
            )),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build method
  }
}

class TodoList extends StatelessWidget {
  final Todo todo;
  const TodoList(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtherView(todo)));
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey, // Border color
              width: 0.5, // Border width
            ),
          ),
        ),
        padding: const EdgeInsets.all(10.0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10, top: 2),
              child: Icon(Icons.check_box_outline_blank),
            ),
            Expanded(
              child: Text(todo.item,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherView extends StatelessWidget {
  final Todo todo;
  const OtherView(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(todo.item)),
      body: Column(
        children: [
          Text(todo.desc),
        ],
      ),
    );
  }
}

class AddView extends StatelessWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to list:'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.inversePrimary,
                      hintStyle: const TextStyle(fontSize: 17),
                      hintText: 'Add:',
                      suffixIcon: const Icon(Icons.add),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
