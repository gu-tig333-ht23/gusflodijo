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

/* 
1.Gör en ny lista som använder apit, ser ut såhär i exemplet

List<TodoItem> _todoItem = [];
List<TodoItem> get todoitem => _todoItem;

2.Gör en funktion som hämtar lista från api:n
kan se ut såhär: 

void fetchTodos() async {
  var todos = await api.getTodos();
  _todos = todos
  notifyListeners();
}

 */


/* Gör om funktionen så den använder api:t
kan se ut såhär:
void addTodoItem(TodoItem todoitem) async {
  await api.addTodoItem(todoitem);
  fetchTodos(); <------ göt så listan uppdateras direkt när något läggs till.
}
*/
void addToList(TodoItem todoitem) {
    todolist.add(todoitem);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();

  
  }
}