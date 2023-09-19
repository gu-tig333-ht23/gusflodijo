import 'package:flutter/material.dart';
import './api.dart' as api;
import 'TodoItem.dart';

class MyState extends ChangeNotifier {
 
  String filter = 'All';
  
  List<TodoItem> _todolist= [
    
  ];
List<TodoItem> get todolist => _todolist;



//har hämtat todolist som MAP
void fetchTodos() async {
  var todolist = await api.getTodos();
  _todolist = todolist;
  notifyListeners();
}


void addTodos(TodoItem todoitem) async {
  print('i addtodos i mystate');
  await api.addTodos(todoitem);
  fetchTodos();
}

void deleteTodoItem(id) async{
  await api.deleteTodoItem(id);
  fetchTodos();
}

/*
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
  */
  @override
  void notifyListeners() {
    super.notifyListeners();

  
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
/*
void addToList(TodoItem todoitem) {
    todolist.add(todoitem);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();

  
  }
}
*/
