import 'package:flutter/material.dart';
import './api.dart' as api;
import 'TodoItem.dart';

class MyState extends ChangeNotifier {
  String filter = 'All';
  List<TodoItem> _todolist = [];
  List<TodoItem> get todolist => _todolist;

// Fetch todo
  void fetchTodos() async {
    var todolist = await api.getTodos();
    _todolist = todolist;
    notifyListeners();
  }

// Add todo
  void addTodos(TodoItem todoitem) async {
    await api.addTodos(todoitem);
    fetchTodos();
  }

// Delete Todo
  void deleteTodoItem(id) async {
    await api.deleteTodoItem(id);
    fetchTodos();
  }
// Update Todo
  void updateTodoItem(TodoItem todoitem) async {
    await api.updateTodoItem(todoitem);
    fetchTodos();
  }

  //Filter for ListviewBuilder
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
