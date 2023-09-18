import 'package:flutter/material.dart';

import 'TodoItem.dart';

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

  @override
  void notifyListeners() {
    super.notifyListeners();

  
  }
}