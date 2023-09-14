import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listviewbuilder.dart';
import 'addview.dart';


//UI = f(State)
class MyState extends ChangeNotifier {
 
  String filter = 'All';
  
  List<TodoItem> todolist = [
    TodoItem('att göra 1', false),
    TodoItem('att göra 2', false),
    TodoItem('att göra 3', false),
    TodoItem('att göra 4', true),
    TodoItem('att göra 5', true),

  ];
  List<TodoItem> get filteredTodos {
    switch (filter) {
      case 'Done':
        return todolist.where((todolist) => todolist.isDone).toList();
      case 'Not Done':
        return todolist.where((todolist) => !todolist.isDone).toList();
      default:
        return todolist;
    }
  }
  
void addToList(TodoItem todoitem) {
    todolist.add(todoitem);
    notifyListeners();
  }
}

class TodoItem {
  String item;
  bool isDone;

  TodoItem(this.item, this.isDone);
}

void main() {
  MyState state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHome());
  }
}

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
              });
            },
            items: ['All', 'Done', 'Not Done'].map((filter) {
              return DropdownMenuItem<String>(
                value: (filter),
                child: Text(filter),
              );
            }).toList()
          ),
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
          ;
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}

