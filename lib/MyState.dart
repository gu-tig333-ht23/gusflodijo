import 'package:flutter/material.dart';
import './api.dart' as api;
import 'TodoItem.dart';

class MyState extends ChangeNotifier {
  String filter = 'All';
  List<TodoItem> _todolist = [];
  List<TodoItem> get todolist => _todolist;

//Hämtar todos från API
  void fetchTodos() async {
    var todolist = await api.getTodos();
    _todolist = todolist;
    notifyListeners();
  }

//Lägga till Todo-funktion till API
  void addTodos(TodoItem todoitem) async {
    print('i addtodos i mystate');
    await api.addTodos(todoitem);
    fetchTodos();
  }

//Deletefunktion som deletar via API
  void deleteTodoItem(id) async {
    await api.deleteTodoItem(id);
    fetchTodos();
  }

  //Filter för ListviewBuilder
  List<TodoItem> get filteredTodos {
    switch (filter) {
      case 'Done':
        return todolist.where((todolist) => todolist.done).toList();
      case 'Not Done':
        return todolist.where((todolist) => !todolist.done).toList();
      default:
        return todolist;
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
